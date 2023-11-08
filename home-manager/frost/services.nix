{ config, pkgs, inputs, outputs, ... }: {

  programs = {
    gpg.enable = true;
    firefox = {
      enable = true;
      profiles.smj = {
        name = "smj";
        isDefault = true;
# extensions = with pkgs.nur.repos.rycee.firefox-addons; [
#   ublock-origin
#   sidebery
#   enhancer-for-youtube
#   bitwarden
#   darkreader
#   privacy-badger
#   firefox-color
# ];
        search.default = "DuckDuckGo";
        search.force = true;
        search.order = [
          "DuckDuckGo"
            "Google"
        ];
# For userchrome, set toolkit.legacyUserProfileCustomizations.stylesheets preference to true in about:config
        userChrome = builtins.readFile ./firefox/userChrome.css;
        userContent = builtins.readFile ./firefox/userContent.css;
      };
    };
    git = {
			enable = true;
			userEmail = "stevemathewjoy@gmail.com";
			userName = "RaySlash";
		};
    alacritty = {
			enable = true;
      package = pkgs.unstable.alacritty;
			settings = {
				window = {
					colors = {
    					primary = {
        					background = "#1E1E2E"; # base
        					foreground = "#CDD6F4"; # text
        					dim_foreground = "#CDD6F4"; # text
        					bright_foreground = "#CDD6F4"; # text
						};
    					cursor = {
        					text = "#1E1E2E"; # base
        					cursor = "#F5E0DC"; # rosewater
						};
    					vi_mode_cursor = {
        					text = "#1E1E2E"; # base
        					cursor = "#B4BEFE"; # lavender
						};
    					search = {
        					matches = {
            					foreground = "#1E1E2E"; # base
            					background = "#A6ADC8"; # subtext0
							};
        					focused_match = {
            					foreground = "#1E1E2E"; # base
            					background = "#A6E3A1"; # green
							};
        					footer_bar = {
            					foreground = "#1E1E2E"; # base
            					background = "#A6ADC8"; # subtext0
							};
						};
						hints = {
        					start = {
            					foreground = "#1E1E2E"; # base
            					background = "#F9E2AF"; # yellow
							};
        					end = {
            					foreground = "#1E1E2E"; # base
            					background = "#A6ADC8"; # subtext0
							};
    						selection = {
        						text = "#1E1E2E"; # base
        						background = "#F5E0DC"; # rosewater
							};
						};
    					normal = {
        					black = "#45475A"; # surface1
					        red = "#F38BA8"; # red
        					green = "#A6E3A1"; # green
					        yellow = "#F9E2AF"; # yellow
					        blue = "#89B4FA"; # blue
					        magenta = "#F5C2E7"; # pink
					        cyan = "#94E2D5"; # teal
					        white = "#BAC2DE"; # subtext1
						};
					    bright = {
					        black = "#585B70"; # surface2
					        red = "#F38BA8"; # red
					        green = "#A6E3A1"; # green
					        yellow = "#F9E2AF"; # yellow
					        blue = "#89B4FA"; # blue
					        magenta = "#F5C2E7"; # pink
				    	    cyan = "#94E2D5"; # teal
					        white = "#A6ADC8"; # subtext0
					    };
						dim = {
					        black = "#45475A"; # surface1
					        red = "#F38BA8"; # red
					        green = "#A6E3A1"; # green
					        yellow = "#F9E2AF"; # yellow
					        blue = "#89B4FA"; # blue
					        magenta = "#F5C2E7"; # pink
					        cyan = "#94E2D5"; # teal
					        white = "#BAC2DE"; # subtext1
						};
					};
					decorations = "none";
					opacity = 0.8;
					dynamic_title = true;
					history = 100000;
					multiplier = 2;
					cursor ={
						text = "CellBackground";
						cursor = "CellForeground";
					};
					vi_mode_cursor = {
						text = "CellBackground";
						cursor = "CellForeground";
					};
					transparent_background_colors = false;
				};
				bell = {
					animation = "EaseOutExpo";
					duration = 0;
					color = "#ffffff";
				};
				cursor = {
					style = {
						shape = "Block";
						blinking = "On";
					};
					vi_mode_style = "None";
					blink_interval = 750;
					blink_timeout = 0;
					live_config_reload = true;
				};
			}; 
		};
  };
}