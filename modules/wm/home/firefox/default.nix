{inputs, ...}: let
  userChrome = builtins.readFile (./. + "/userChrome");
in {
  programs.firefox = {
    enable = true;
    profiles.joy = {
      userChrome = userChrome;
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        darkreader
        libredirect
        search-by-image
        terms-of-service-didnt-read
        istilldontcareaboutcookies
        decentraleyes
        mtab
      ];
      search.engines = {
        "4get" = {
          urls = [
            {
              template = "https://4get.joygnu.org/web";
              params = [
                {
                  name = "s";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          definedAliases = ["@4get"];
        };
      };
      search.force = true;
      search.default = "4get";

      bookmarks = [
        {
          name = "Bookmarks";
          toolbar = true;
          bookmarks = [
            {
              name = "Packages";
              url = "https://search.nixos.org/packages?channel=unstable";
            }
            {
              name = "Homemanager";
              url = "https://home-manager-options.extranix.com";
            }
            {
              name = "Stylix";
              url = "https://stylix.danth.me/options/nixos.html";
            }
            {
              name = "Git";
              url = "https://git.joygnu.org/";
            }
            {
              name = "Photos";
              url = "https://immich.joygnu.org/";
            }
            {
              name = "Translate";
              url = "https://trans.joygnu.org/";
            }
            {
              name = "Server";
              url = "https://avoro.eu/cp/clientarea.php?action=productdetails&id=27920";
            }
            {
              name = "Domain";
              url = "https://ap.www.namecheap.com/domains/list/";
            }
            {
              name = "Github";
              url = "https://www.github.com";
            }
            {
              name = "Hyprland";
              url = "https://wiki.hyprland.org/";
            }
            {
              name = "Helix";
              url = "https://helix-editor.com/";
            }
            {
              name = "Monkeytype";
              url = "https://monkeytype.com/";
            }
            {
              name = "Zophar's Domain";
              url = "https://www.zophar.net/music";
            }
            {
              name = "Syncthing";
              url = "http://localhost:8384/";
            }
            {
              name = "invidious";
              url = "https://yt.joygnu.org/";
            }
          ];
        }
      ];
      settings = {
        "dom.security.https_only_mode" = true;
        "browser.download.panel.shown" = true;
        "identity.fxaccounts.enabled" = false;
        "signon.rememberSignons" = false;
        "browser.urlbar.pocket.featureGate" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.defaultBrowserCheckCount" = 1;
        "privacy.trackingprotection.enabled" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.uiCustomization.state" = ''
          {
            "placements": {
              "widget-overflow-fixed-list": [],
              "nav-bar": [
                "back-button",
                "forward-button",
                "stop-reload-button",
                "urlbar-container",
                "downloads-button",
                "ublock0_raymondhill_net-browser-action",
                "addon_darkreader_org-browser-action",
                "_testpilot-containers-browser-action"
              ],
              "toolbar-menubar": [
                "menubar-items"
              ],
              "TabsToolbar": [
                "tabbrowser-tabs",
                "new-tab-button",
                "alltabs-button"
              ],
              "PersonalToolbar": [
                "personal-bookmarks"
              ]
            },
            "seen": [
              "save-to-pocket-button",
              "developer-button",
              "ublock0_raymondhill_net-browser-action",
              "addon_darkreader_org-browser-action",
              "_testpilot-containers-browser-action"
            ],
            "dirtyAreaCache": [
              "nav-bar",
              "PersonalToolbar",
              "toolbar-menubar",
              "TabsToolbar",
              "widget-overflow-fixed-list"
            ],
            "currentVersion": 18,
            "newElementCount": 4
          }
        '';
      };
    };
  };
}
