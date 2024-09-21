{inputs, ...}: {
  imports = [
    ./user.nix
  ];

  home-manager.users.joy.programs.firefox = {
    enable = true;
    profiles.joy = {
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
          name = "Nix sites";
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
              name = "Server";
              url = "https://avoro.eu/cp/clientarea.php?action=productdetails&id=27920";
            }
            {
              name = "Domain";
              url = "https://ap.www.namecheap.com/domains/list/";
            }
            {
              name = "Translate";
              url = "https://trans.joygnu.org/";
            }
            {
              name = "Syncthing";
              url = "http://localhost:8384/";
            }
            {
              name = "GitHub";
              url = "https://github.com/";
            }
            {
              name = "Codeberg";
              url = "https://codeberg.org/";
            }
            {
              name = "Zophar's Domain";
              url = "https://www.zophar.net/music";
            }
            {
              name = "Hyprland";
              url = "https://wiki.hyprland.org/";
            }
            {
              name = "Monkeytype";
              url = "https://monkeytype.com/";
            }
            {
              name = "invidious";
              url = "http://localhost:3000/";
            }
          ];
        }
      ];

      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        darkreader
        libredirect
        search-by-image
        terms-of-service-didnt-read
        istilldontcareaboutcookies
        decentraleyes
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
