{
  inputs, ... }:

{
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
          { name = "Startpage"; url = "https://www.startpage.com/"; }
          { name = "DuckDuckGo"; url = "https://duckduckgo.com/"; }
          { name = "Gamepad Tester"; url = "https://gamepad-tester.com/"; }
          { name = "Zophar's Domain"; url = "https://www.zophar.net/music"; }
          { name = "Cmus Playlist Guide"; url = "https://unix.stackexchange.com/questions/328856/how-can-i-create-a-playlist-and-add-songs-to-it-in-cmus"; }
          { name = "Spotify Downloader"; url = "https://spotify-downloader.com/"; }
        ];
      }];
        
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

      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        darkreader
        libredirect
        search-by-image
        decentraleyes
      ];

      userChrome = ''

/*================== Gruvbox Theme for Firefox ==================
Author: kmason
Based on the color scheme of calvinchd's Gruvbox Dark Firefox Theme - https://gitlab.com/calvinchd/gruvbox-dark-firefox-theme
*/
@namespace xul "http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul";

:root {
--background: #1d2021;
--secondary: #282828;
--foreground: #EBDBB2;

--orange-highlight: #fe8019;
--sound-border: #68217A;

--separator: #665e54;

--toolbar-bgcolor: var(--secondary) !important;

--tab: var(--background);
--tab-btn: var(--tab-inactive);
--tab-inactive: var(--secondary);
--tab-btn-inactive: var(--tab-inactive);
--tab-hover: #32302f;
--tab-btn-hover: #3C3836;
--toolbar-btn-hover: #49463f;

--url-bar: #3C3836;
--url-focus: #504945;
--url-bar-item-hover: #6a6257;

--sidebar: #3C3836;
--sidebar-button-hover: #5A544B;
--sidebar-highlight: #458588;
}

/*
SEARCH AND POPUPS/MENUS
*/

.panel-arrowcontainer {
  background-color: var(--secondary) !important;
}

#PopupAutoComplete,
#PopupSearchAutoComplete
{
  background-color: var(--url-focus) !important;
  color: var(--foreground) !important;
}

panelview {
  background-color: var(--sidebar) !important;
  color: var(--foreground) !important;
}

panelview toolbarbutton.subviewbutton:hover {
  background-color: var(--sidebar-button-hover) !important;
}

panel[type="autocomplete-richlistbox"] {
  --panel-background: none !important;
  border-radius: 4px !important;
  color: var(--foreground) !important;
}

/*
 _____ ___   ___  _    ___   _   ___
|_   _/ _ \ / _ \| |  | _ ) / \ | _ \
  | || (_) | (_) | |__| _ \/ = \|   /
  |_| \___/ \___/|____|___/_/ \_\_|\_\

*/

toolbarseparator,
menuseparator
{
  border-color: var(--separator) !important;
  border-image: none !important;
}

toolbar {
  background-color: var(--secondary);
}

toolbar#TabsToolbar {
  background-color: var(--background);
}
toolbar#TabsToolbar:-moz-window-inactive {
  background-color: var(--toolbar-bgcolor) !important;
}

#titlebar,
#titlebar-spacer,
#titlebar-buttonbox-container
{
  background-color: var(--background) !important;
  border: none !important;
}

#navigator-toolbox {
  --tabs-border-color: var(--orange-highlight) !important;
}

/* Remove border under navbar */
#navigator-toolbox::after {
  border-bottom: 0px !important;
}

/* remove some borders */
#navigator-toolbox {
  border: none !important;
}

/* 
 _   _ ___  _    ___   _   ___
| | | | _ \| |  | _ ) / \ | _ \
| |_| |   /| |__| _ \/ = \|   /
 \___/|_|\_\____|___/_/ \_\_|\_\

*/

#urlbar,
#searchbar
{
	box-shadow: none !important;
	border: none !important;
  border-radius: 4px;
	color : var(--foreground) !important;
  background-color: var(--url-bar) !important;
  --autocomplete-popup-separator-color: var(--separator) !important;
} 

#urlbar-input,
#urlbar-input-container
{
  color: var(--foreground) !important;
  background-color: var(--url-bar) !important;
  text-align: center !important;
}

#urlbar:not([open]) #urlbar-input-container:focus-within,
#searchbar:focus-within 
{
	border: 2px solid var(--orange-highlight) !important;
}

#urlbar:focus-within,
#urlbar[open],
#urlbar[open] #urlbar-input-container,
#urlbar[open] #urlbar-input,
#urlbar-input-container:focus-within,
#urlbar-input:focus,
#urlbar-background,
.urlbarView,
#searchbar:focus-within,
menupop
{
  background-color: var(--url-focus) !important;
} 
#searchbar:focus-within {
  outline: none !important;
}

:is(panel, menupopup)::part(content) {
  background: none !important;
}

.urlbarView button:hover,
#searchbar button:hover,
.urlbarView-row:hover .urlbarView-row-inner,
.search-autocomplete-richlistbox-popup .autocomplete-richlistitem:hover
{
	background-color: var(--url-bar-item-hover) !important;
}

.urlbarView-row[type="switchtab"] > span{
  color: var(--orange-highlight) !important;
}

#PopupSearchAutoComplete .autocomplete-richlistitem[selected],
.searchbar-engine-one-off-item[selected],
.urlbarView-row[selected],
.urlbarView-row[aria-selected="true"],
.urlbarView-row:not([type="tip"], [type="dynamic"])[selected] > .urlbarView-row-inner,
.urlbarView-row-inner[selected]
{
  color: var(--foreground) !important;
	background-color: var(--sidebar-highlight) !important;
  border-radius: 4px !important;
}

/* 
BOOKMARKS BAR
*/

#PersonalToolbar {
  background-color: var(--secondary) !important;
}

/*
  _____ _   ___ ___
 |_   _/ \ | _ ) __|
   | |/ = \| _ \__ \
   |_/_/ \_\___/___/

*/
.tab-background[selected="true"] {
  background-color: transparent !important;
  background-image: none !important;
}
.tabbrowser-tab:hover > .tab-stack > .tab-background:not([selected="true"]):not([multiselected]){ 
  background-color: transparent !important;
}

.tabbrowser-tab[soundplaying="true"] {
  --lwt-tab-line-color: var(--sound-border) !important;
}
.tab-content[selected="true"] {
  border-color: var(--orange-highlight) !important;
  --sound-border: var(--orange-highlight) !important;
}
.tab-text {
  color: var(--foreground);
}

tab,
#tabbrowser-tabs
{
  background-color: var(--background) !important;
  color : var(--foreground) !important;
}
tab:-moz-window-inactive,
#tabbrowser-tabs:-moz-window-inactive,
#nav-bar-customization-target
{
  background-color: var(--secondary) !important;
}

.tabbrowser-tab[selected]{
  opacity: 1;
}

.tab-loading-burst {
  background-color: inherit;
}

.tab-content
{
  border-radius: 4px;
  margin: 5px 0px 5px 0px !important;
  border: 1px solid transparent !important;
}
.tab-content[selected="true"]
{
  background-color: var(--secondary) !important;
  color : var(--foreground) !important;
  border: 1px solid var(--orange-highlight) !important;
}
.tab-content:not([selected="true"]):hover { 
  background-color: var(--tab-hover) !important; 
}

/*
   ___ _____ ___  _  ___
  | _ )_   _|   \| |/ __|
  | _ \ | | | |\ | |\__ \
  |___/ |_| |_| \__|/___/

*/

/* 
Toolbar buttons 
*/

toolbarbutton {
  fill: var(--foreground) !important;
  background-color: transparent !important;
}

/* 
TAB BAR BUTTONS
*/

#TabsToolbar toolbarbutton {
  border-radius: 4px;
  border: 1px solid transparent !important;
}
#TabsToolbar toolbarbutton:-moz-window-inactive {
  opacity: 0.7 !important;
}

#alltabs-button > .toolbarbutton-badge-stack,
#tabs-newtab-button > .toolbarbutton-icon {
  background-image: none;
  border-radius: 6px;
}
#alltabs-button:hover > .toolbarbutton-badge-stack,
#tabs-newtab-button:hover > .toolbarbutton-icon {
  background-color: var(--tab-btn-hover) !important;
}

/* Firefox View button */
#TabsToolbar #firefox-view-button > .toolbarbutton-icon
{
  background-image: none !important;
  border-radius: 4px;
}
#TabsToolbar #firefox-view-button[open] > .toolbarbutton-icon
{
  background-color: var(--secondary) !important;
  color : var(--foreground) !important;
  padding: 9px !important;
  border: 1px solid var(--orange-highlight) !important;
}
#TabsToolbar #firefox-view-button:not([open]):hover > .toolbarbutton-icon { 
  background-color: var(--tab-hover) !important; 
}

/* 
MIDDLE BAR (url bar) BUTTONS 
*/

#nav-bar toolbarbutton > .toolbarbutton-icon,
#nav-bar toolbarbutton > .toolbarbutton-badge-stack {
  border-radius: 6px;
}
#nav-bar toolbarbutton:hover > .toolbarbutton-icon,
#nav-bar toolbarbutton:hover > .toolbarbutton-badge-stack {
  background-color: var(--toolbar-btn-hover) !important;
}

#back-button {
  padding-right: 2px !important;
  padding-left: 2px !important;
  margin-left: 6px !important;
}

/* Hamburger Menu */
#PanelUI-menu-button {
  background-color: var(--secondary) !important;
  padding-right: 2px !important;
  margin-right: 6px !important;
}

/* 
BOOKMARK BUTTONS
*/
#PersonalToolbar toolbarbutton {
  margin: 3px 0px 3px 3px !important;
  border-radius: 4px;
}
#PersonalToolbar toolbarbutton:hover {
  background-color: var(--toolbar-btn-hover) !important;
}
 '';

      userContent = ''

:root {
  --background: #1d2021;
  --secondary: #282828;
  --newtab-body: #32302f;
  --foreground: #EBDBB2;
}

@-moz-document url-prefix("about:"), url-prefix("about:newtab"), url-prefix("about:home") {
  html, body {
    color: var(--foreground) !important;
    background-color: var(--newtab-body) !important;
  }
}
      '';



    };
  };
}

