{
  inputs,
  username,
  domain,
  lib,
  config,
  ...
}: {
  options = {
    firefox.enable = lib.mkEnableOption "";
  };
  imports = [./userChrome.nix];
  config = lib.mkIf config.firefox.enable {
    home-manager.users.${username} = {
      programs.firefox = {
        enable = true;
        profiles.${username} = {
          extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
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
                  template = "https://4get.${domain.a}/web";
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

          bookmarks = {
            force = true;
            settings = [
              {
                name = "Bookmarks";
                toolbar = true;
                bookmarks = [
                  {
                    name = "Packages";
                    url = "https://search.nixos.org/packages?channel=unstable";
                  }
                  {
                    name = "PR";
                    url = "https://nixpk.gs/pr-tracker.html";
                  }
                  {
                    name = "Homemanager";
                    url = "https://home-manager-options.extranix.com/?query=&release=master";
                  }
                  {
                    name = "Stylix";
                    url = "https://stylix.danth.me/options/nixos.html";
                  }
                  {
                    name = "NixOS Mailserver";
                    url = "https://nixos-mailserver.readthedocs.io/en/latest/";
                  }
                  {
                    name = "webmail";
                    url = "https://mail.${domain.a}/";
                  }
                  {
                    name = "Git";
                    url = "https://git.${domain.a}/";
                  }
                  {
                    name = "Syncserver";
                    url = "https://sync.${domain.a}/";
                  }
                  {
                    name = "Photos";
                    url = "https://immich.${domain.a}/";
                  }
                  {
                    name = "Translate";
                    url = "https://trans.${domain.a}/";
                  }
                  {
                    name = "invidious";
                    url = "https://yt.${domain.a}/";
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
                    name = "Yazi";
                    url = "https://yazi-rs.github.io/docs/installation";
                  }
                  {
                    name = "Monkeytype";
                    url = "https://monkeytype.com/";
                  }
                  {
                    name = "Syncthing";
                    url = "http://localhost:8384/";
                  }
                ];
              }
            ];
          };
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
    };
  };
}
