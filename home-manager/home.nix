{ pkgs, ... }:

{
  home.username = "mystiafin";
  home.homeDirectory = "/home/mystiafin";
  home.stateVersion = "25.11";
  home.packages = with pkgs; [
					p7zip
					ffmpeg
					ffmpegthumbnailer
					yazi
					tailscale
					brightnessctl
					fzf
					fastfetch
					git
					grim
					slurp
					keyd
					wl-clipboard
					cava
					ripgrep
					unzip
					tmux
					nemo
					fish
					obs-studio
					nwg-clipman
					nwg-look
					btop
					gthumb
  ];

  programs.home-manager.enable = true;
}
