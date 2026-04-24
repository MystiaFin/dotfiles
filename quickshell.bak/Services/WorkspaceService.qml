import QtQuick
import Quickshell
import Quickshell.Io

Item {
    id: root

    property int activeIndex: 0
    property string activeWindowTitle: "Desktop"
    property alias model: workspaceModel

    // Detect if we are on Hyprland
    property bool isHyprland: (Quickshell.env("XDG_CURRENT_DESKTOP") || "").toLowerCase().includes("hyprland")

    ListModel {
        id: workspaceModel
    }

    function focus(id) {
        // Hyprland usually focuses by ID or Name
        focusProcess.command = ["hyprctl", "dispatch", "workspace", id.toString()];
        focusProcess.running = true;
    }

    Process {
        id: focusProcess
        running: false
    }

    // Process to fetch Workspaces
    Process {
        id: hyprWsProcess
        running: false
        command: ["hyprctl", "workspaces", "-j"]

        property string buffer: ""
        stdout: SplitParser {
            onRead: data => hyprWsProcess.buffer += data
        }

        onExited: (code, status) => {
            if (code !== 0 || hyprWsProcess.buffer.trim() === "") {
                hyprWsProcess.buffer = "";
                return;
            }

            try {
                let ws = JSON.parse(hyprWsProcess.buffer);
                // Sort by ID to keep the bar consistent
                ws.sort((a, b) => a.id - b.id);

                for (let i = 0; i < ws.length; i++) {
                    let w = ws[i];
                    
                    // Hyprland workspaces often don't have a simple 'focused' bool 
                    // in the workspaces list; we usually track this via the monitor
                    // or the 'activeWindow' call. However, newer Hyprland versions 
                    // include monitor data. 
                    
                    let itemData = {
                        "workspaceId": w.id,
                        "name": w.name,
                        "active": false // Updated in the activeWindow process
                    };

                    if (i < workspaceModel.count) {
                        workspaceModel.set(i, itemData);
                    } else {
                        workspaceModel.append(itemData);
                    }
                }
                while (workspaceModel.count > ws.length)
                    workspaceModel.remove(workspaceModel.count - 1);
            } catch (e) {
                console.error("Hyprland Ws Parse Error: " + e.message);
            }
            hyprWsProcess.buffer = "";
        }
    }

    // Process to fetch Active Window and Active Workspace ID
    Process {
        id: hyprActiveProcess
        running: false
        command: ["hyprctl", "activewindow", "-j"]

        property string buffer: ""
        stdout: SplitParser {
            onRead: data => hyprActiveProcess.buffer += data
        }

        onExited: (code, status) => {
            if (code !== 0 || hyprActiveProcess.buffer.trim() === "") {
                // If no window is focused, set to Desktop
                root.activeWindowTitle = "Desktop";
                hyprActiveProcess.buffer = "";
                return;
            }

            try {
                let active = JSON.parse(hyprActiveProcess.buffer);
                
                // Update Title
                let newTitle = active.title || "Unknown";
                if (root.activeWindowTitle !== newTitle)
                    root.activeWindowTitle = newTitle;

                // Update Active State in Model
                let activeWsId = active.workspace.id;
                for (let i = 0; i < workspaceModel.count; i++) {
                    let item = workspaceModel.get(i);
                    let isActive = (item.workspaceId === activeWsId);
                    if (item.active !== isActive) {
                        workspaceModel.setProperty(i, "active", isActive);
                    }
                    if (isActive) root.activeIndex = i;
                }

            } catch (e) {
                // Occurs if hyprctl returns empty or invalid JSON (common when no windows open)
                root.activeWindowTitle = "Desktop";
            }
            hyprActiveProcess.buffer = "";
        }
    }

    Timer {
        interval: 250
        running: true
        repeat: true
        onTriggered: {
            if (root.isHyprland) {
                if (!hyprWsProcess.running)
                    hyprWsProcess.running = true;
                if (!hyprActiveProcess.running)
                    hyprActiveProcess.running = true;
            }
        }
    }
}
