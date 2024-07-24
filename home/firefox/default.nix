{ inputs, ... }:

{

  imports = [
    ./user.nix
  ];
  
  programs.firefox = {
    enable = true;
    profiles.joy = {
      search.engines = {
        "4get" = {
          urls = [{
            template = "https://4get.ch/web";
            params = [
              { name = "s"; value = "{searchTerms}"; }
            ];
          }];
          definedAliases = [ "@4get" ];
        };
      };
      search.force = true;
      search.default = "4get";

      bookmarks = [{
        name = "Nix sites";
        toolbar = true;
        bookmarks = [
          { name = "Packages"; url = "https://search.nixos.org/packages?channel=unstable"; }
          { name = "Homemanager"; url = "https://nix-community.github.io/home-manager/options.xhtml"; }
          { name = "Stylix"; url = "https://stylix.danth.me/options/nixos.html"; }
          { name = "Socials Joy"; url = "https://joygnu.org/"; }
          { name = "Wallpapers"; url = "https://wallpapers.joygnu.org/"; }
          { name = "Server"; url = "https://avoro.eu/cp/clientarea.php?action=productdetails&id=27920"; }
          { name = "Domain"; url = "https://registrar.epik.com/domain-management/host-records"; }
          { name = "Translate"; url = "https://simplytranslate.org/"; }
          { name = "Syncthing"; url = "http://localhost:8384/"; }
          { name = "GitHub"; url = "https://github.com/"; }
          { name = "Codeberg"; url = "https://codeberg.org/"; }
          { name = "Gamepad Tester"; url = "https://gamepad-tester.com/"; }
          { name = "Zophar's Domain"; url = "https://www.zophar.net/music"; }
          { name = "Spotify Downloader"; url = "https://spotify-downloader.com/"; }
          { name = "Hyprland"; url = "https://wiki.hyprland.org/"; }
          { name = "Monkeytype"; url = "https://monkeytype.com/"; }
        ];
      }];
        
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        darkreader
        libredirect
        search-by-image
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
        "browser.startup.homepage" = "moz-extension://f3ba075e-5213-4eca-b67c-470714db5333/index.html";
        #MTAB_SAVE_FORMAT_JTIyJTdCJTVDJTIydXNlciU1QyUyMiUzQSU3QiU1QyUyMm5hbWUlNUMlMjIlM0ElNUMlMjJKb3klNUMlMjIlN0QlMkMlNUMlMjJ0aXRsZSU1QyUyMiUzQSU3QiU1QyUyMmRlZmF1bHRUaXRsZSU1QyUyMiUzQSU1QyUyMkpveSU1QyUyMiUyQyU1QyUyMmR5bmFtaWMlNUMlMjIlM0ElN0IlNUMlMjJlbmFibGVkJTVDJTIyJTNBdHJ1ZSU3RCU3RCUyQyU1QyUyMm1lc3NhZ2UlNUMlMjIlM0ElN0IlNUMlMjJlbmFibGVkJTVDJTIyJTNBdHJ1ZSUyQyU1QyUyMmZvbnQlNUMlMjIlM0ElNUMlMjIlNUMlNUMlNUMlMjJKZXRicmFpbnMtTW9uby1SZWd1bGFyLUZpeGVkJTVDJTVDJTVDJTIyJTVDJTIyJTJDJTVDJTIydGV4dENvbG9yJTVDJTIyJTNBJTVDJTIydW5kZWZpbmVkJTVDJTIyJTJDJTVDJTIydHlwZSU1QyUyMiUzQSU1QyUyMmFmdGVybm9vbi1tb3JuaW5nJTVDJTIyJTJDJTVDJTIyY3VzdG9tVGV4dCU1QyUyMiUzQSU1QyUyMnlvdXIlMjBjdXN0b20lMjB0ZXh0JTVDJTIyJTdEJTJDJTVDJTIyd2FsbHBhcGVyJTVDJTIyJTNBJTdCJTVDJTIydHlwZSU1QyUyMiUzQSU1QyUyMnVybCU1QyUyMiUyQyU1QyUyMmVuYWJsZWQlNUMlMjIlM0FmYWxzZSUyQyU1QyUyMnVybCU1QyUyMiUzQSU1QyUyMi4lMkZ3YWxscGFwZXJzJTJGYmctMS5wbmclNUMlMjIlN0QlMkMlNUMlMjJ1aSU1QyUyMiUzQSU3QiU1QyUyMnN0eWxlJTVDJTIyJTNBJTVDJTIyc29saWQlNUMlMjIlMkMlNUMlMjJmb3JlZ3JvdW5kQ29sb3IlNUMlMjIlM0ElNUMlMjIlMjMzQzM4MzYlNUMlMjIlMkMlNUMlMjJiYWNrZ3JvdW5kQ29sb3IlNUMlMjIlM0ElNUMlMjIlMjMyODI4MjglNUMlMjIlMkMlNUMlMjJoaWdobGlnaHRDb2xvciU1QyUyMiUzQSU1QyUyMiUyM2ZmZmZmZiU1QyUyMiU3RCUyQyU1QyUyMmFuaW1hdGlvbnMlNUMlMjIlM0ElN0IlNUMlMjJlbmFibGVkJTVDJTIyJTNBdHJ1ZSUyQyU1QyUyMmJvb2ttYXJrVGltaW5nJTVDJTIyJTNBJTVDJTIybGVmdCU1QyUyMiUyQyU1QyUyMnR5cGUlNUMlMjIlM0ElNUMlMjJhbmltYXRlLXVwLWJvdW5jeSU1QyUyMiU3RCUyQyU1QyUyMnNlYXJjaCU1QyUyMiUzQSU3QiU1QyUyMmVuYWJsZWQlNUMlMjIlM0FmYWxzZSUyQyU1QyUyMmZvbnQlNUMlMjIlM0ElNUMlMjIlNUMlNUMlNUMlMjJKZXRicmFpbnMtTW9uby1SZWd1bGFyLUZpeGVkJTVDJTVDJTVDJTIyJTVDJTIyJTJDJTVDJTIydGV4dENvbG9yJTVDJTIyJTNBJTVDJTIydW5kZWZpbmVkJTVDJTIyJTJDJTVDJTIycGxhY2Vob2xkZXJUZXh0JTVDJTIyJTNBJTVDJTIyc2VhcmNoLi4uJTVDJTIyJTJDJTVDJTIycGxhY2Vob2xkZXJUZXh0Q29sb3IlNUMlMjIlM0ElNUMlMjJ1bmRlZmluZWQlNUMlMjIlMkMlNUMlMjJlbmdpbmUlNUMlMjIlM0ElNUMlMjJicmF2ZSU1QyUyMiUyQyU1QyUyMmZvY3VzZWRCb3JkZXJDb2xvciU1QyUyMiUzQSU1QyUyMiUyMzBlYTVlOSU1QyUyMiU3RCUyQyU1QyUyMmhvdGtleXMlNUMlMjIlM0ElN0IlNUMlMjJlbmFibGVkJTVDJTIyJTNBdHJ1ZSUyQyU1QyUyMmFjdGl2YXRpb25LZXklNUMlMjIlM0ElNUMlMjIlMjAlNUMlMjIlMkMlNUMlMjJjbG9zZVBhZ2VLZXklNUMlMjIlM0ElNUMlMjJ4JTVDJTIyJTdEJTJDJTVDJTIyYm9va21hcmtzJTVDJTIyJTNBJTdCJTVDJTIydHlwZSU1QyUyMiUzQSU1QyUyMnVzZXItZGVmaW5lZCU1QyUyMiUyQyU1QyUyMnVzZXJEZWZpbmVkJTVDJTIyJTNBJTVCJTdCJTVDJTIybmFtZSU1QyUyMiUzQSU1QyUyMmdpdGh1YiU1QyUyMiUyQyU1QyUyMnVybCU1QyUyMiUzQSU1QyUyMmh0dHBzJTNBJTJGJTJGZ2l0aHViLmNvbSU1QyUyMiUyQyU1QyUyMmNvbG9yJTVDJTIyJTNBJTVDJTIyJTIzNDU4NTg4JTVDJTIyJTJDJTVDJTIyaWNvblR5cGUlNUMlMjIlM0ElNUMlMjJyaS1naXRodWItZmlsbCU1QyUyMiUyQyU1QyUyMmljb25Db2xvciU1QyUyMiUzQSU1QyUyMiUyM0Q1QzRBMSU1QyUyMiU3RCUyQyU3QiU1QyUyMm5hbWUlNUMlMjIlM0ElNUMlMjJ5b3V0dWJlJTVDJTIyJTJDJTVDJTIydXJsJTVDJTIyJTNBJTVDJTIyaHR0cHMlM0ElMkYlMkZhdm9yby5ldSUyRmNwJTJGY2xpZW50YXJlYS5waHAlM0ZhY3Rpb24lM0Rwcm9kdWN0ZGV0YWlscyUyNmlkJTNEMjc5MjAlNUMlMjIlMkMlNUMlMjJjb2xvciU1QyUyMiUzQSU1QyUyMiUyM2Y0M2Y1ZSU1QyUyMiUyQyU1QyUyMmljb25UeXBlJTVDJTIyJTNBJTVDJTIycmktc2VydmVyLWZpbGwlNUMlMjIlMkMlNUMlMjJpY29uQ29sb3IlNUMlMjIlM0ElNUMlMjIlMjNENUM0QTElNUMlMjIlN0QlMkMlN0IlNUMlMjJuYW1lJTVDJTIyJTNBJTVDJTIyc3R1ZGlvJTVDJTIyJTJDJTVDJTIydXJsJTVDJTIyJTNBJTVDJTIyaHR0cHMlM0ElMkYlMkZnaXQuam95Z251Lm9yZyUyRiU1QyUyMiUyQyU1QyUyMmNvbG9yJTVDJTIyJTNBJTVDJTIyJTIzQjE2Mjg2JTVDJTIyJTJDJTVDJTIyaWNvblR5cGUlNUMlMjIlM0ElNUMlMjJyaS1naXQtYnJhbmNoLWZpbGwlNUMlMjIlMkMlNUMlMjJpY29uQ29sb3IlNUMlMjIlM0ElNUMlMjIlMjNENUM0QTElNUMlMjIlN0QlMkMlN0IlNUMlMjJuYW1lJTVDJTIyJTNBJTVDJTIyc3luYyU1QyUyMiUyQyU1QyUyMnVybCU1QyUyMiUzQSU1QyUyMmh0dHAlM0ElMkYlMkZsb2NhbGhvc3QlM0E4Mzg0JTVDJTIyJTJDJTVDJTIyY29sb3IlNUMlMjIlM0ElNUMlMjIlMjM5ODk3MUElNUMlMjIlMkMlNUMlMjJpY29uVHlwZSU1QyUyMiUzQSU1QyUyMnJpLWdsb2JhbC1maWxsJTVDJTIyJTJDJTVDJTIyaWNvbkNvbG9yJTVDJTIyJTNBJTVDJTIyJTIzRDVDNEExJTVDJTIyJTdEJTVEJTdEJTdEJTIy
        "privacy.trackingprotection.enabled" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.uiCustomization.state" = 
          ''
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

