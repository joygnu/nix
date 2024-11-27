{
  username,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.firefox.enable {
    home-manager.users.${username} = {
      programs.firefox = {
        enable = true;
        profiles.${username} = {
          userChrome = ''
               #alltabs-button { display: none !important; }
               @namespace xul "http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul";

               :root {
                   --background: #${config.home-manager.users.${username}.stylix.base16Scheme.base00};
                   --secondary: #${config.home-manager.users.${username}.stylix.base16Scheme.base01};
                   --foreground: #${config.home-manager.users.${username}.stylix.base16Scheme.base05};
                   --blue-highlight: #${config.home-manager.users.${username}.stylix.base16Scheme.base0D};
                   --separator: #${config.home-manager.users.${username}.stylix.base16Scheme.base03};
                   --toolbar-bgcolor: var(--secondary) !important;
                   --tab: var(--background);
                   --tab-inactive: var(--secondary);
                   --tab-hover: #${config.home-manager.users.${username}.stylix.base16Scheme.base02};
                   --url-bar: #${config.home-manager.users.${username}.stylix.base16Scheme.base01};
               }

               .titlebar-buttonbox-container {
                   display: none !important;
               }

               .panel-arrowcontainer {
                   background-color: var(--secondary) !important;
               }

               #PopupAutoComplete,
               #PopupSearchAutoComplete {
                   background-color: var(--url-bar) !important;
                   color: var(--foreground) !important;
               }

               panelview {
                   background-color: var(--secondary) !important;
                   color: var(--foreground) !important;
               }

               panel[type="autocomplete-richlistbox"] {
                   background-color: transparent !important;
                   border-radius: 4px !important;
                   color: var(--foreground) !important;
               }

               toolbarseparator,
               menuseparator {
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
               #titlebar-buttonbox-container {
                   background-color: var(--background) !important;
                   border: none !important;
               }

               #navigator-toolbox {
                   border: none !important;
               }

               #urlbar,
               #searchbar {
                   box-shadow: none !important;
                   border: none !important;
                   border-radius: 4px;
                   color: var(--foreground) !important;
                   background-color: var(--url-bar) !important;
               }

               #urlbar-input,
               #urlbar-input-container {
                   color: var(--foreground) !important;
                   background-color: var(--url-bar) !important;
               }

               #urlbar:not([open]) #urlbar-input-container:focus-within,
               #searchbar:focus-within {
                   border: 2px solid var(--blue-highlight) !important;
               }

               #urlbar:focus-within,
               #urlbar[open],
               #urlbar[open] #urlbar-input-container,
               #urlbar[open] #urlbar-input,
               #urlbar-input-container:focus-within,
               #urlbar-input:focus,
               menupop {
                   background-color: var(--url-bar) !important;
               }

              :is(panel, menupopup)::part(content) {
                  background:none!important;
              }

              .urlbarView button:hover,
              #searchbar button:hover,
              .urlbarView-row:hover .urlbarView-row-inner,
              .search-autocomplete-richlistbox-popup .autocomplete-richlistitem:hover {
                  background-color :var(--blue-highlight)!important;
              }

              .urlbarView-row[type="switchtab"] > span {
                  color :var(--blue-highlight)!important;
              }

              #PopupSearchAutoComplete .autocomplete-richlistitem[selected],
              .searchbar-engine-one-off-item[selected],
              .urlbarView-row[selected],
              .urlbarView-row[aria-selected="true"],
              .urlbarView-row:not([type="tip"], [type="dynamic"])[selected] > .urlbarView-row-inner,
              .urlbarView-row-inner[selected] {
                  color :var(--foreground)!important;
                  background-color :var(--blue-highlight)!important;
                  border-radius :4px!important;
              }

              #PersonalToolbar {
                  background-color :var(--secondary)!important;
              }

              .tab-background[selected="true"] {
                  background-color :transparent!important;
                  background-image :none!important;
              }

              .tabbrowser-tab:hover > .tab-stack > .tab-background:not([selected="true"]):not([multiselected]) {
                  background-color :transparent!important;
              }

              .tabbrowser-tab[soundplaying="true"] {
                  border-bottom-color :var(--blue-highlight)!important;
              }

              .tab-content[selected="true"] {
                  border-color :var(--blue-highlight)!important;
              }

              .tab-text {
                  color :var(--foreground);
              }

              tab,
              #tabbrowser-tabs {
                  background-color :var(--background)!important;
                  color :var(--foreground)!important;
              }

              tab:-moz-window-inactive,
              #tabbrowser-tabs:-moz-window-inactive,
              #nav-bar-customization-target {
                  background-color :var(--secondary)!important;
              }

             .tabbrowser-tab[selected] {
                 opacity :1;
             }

             .tab-loading-burst {
                 background-color :inherit;
             }

             .tab-content {
                 border-radius :4px;
                 margin :5px 0px 5px 0px!important;
                 border :1px solid transparent!important;
             }

             .tab-content[selected="true"] {
                 background-color :var(--secondary)!important;
                 color :var(--foreground)!important;
                 border :1px solid var(--blue-highlight)!important;
             }

             .tab-content:not([selected="true"]):hover {
                 background-color :var(--tab-hover)!important;
             }

             toolbarbutton {
                 fill :var(--foreground)!important;
                 background-color :transparent!important;
             }

             #TabsToolbar toolbarbutton {
                 border-radius :4px;
                 border :1px solid transparent!important;
             }

             #alltabs-button > .toolbarbutton-badge-stack,
             #tabs-newtab-button > .toolbarbutton-icon {
                 background-image :none;
                 border-radius :6px;
             }

             #alltabs-button:hover > .toolbarbutton-badge-stack,
             #tabs-newtab-button:hover > .toolbarbutton-icon {
                 background-color :var(--blue-highlight)!important;
             }

             #TabsToolbar #firefox-view-button > .toolbarbutton-icon {
                 background-image :none!important;
                 border-radius :4px;
             }

             #TabsToolbar #firefox-view-button[open] > .toolbarbutton-icon {
                 background-color :var(--secondary)!important;
                 color :var(--foreground)!important;
                 padding :9px!important;
                 border :1px solid var(--blue-highlight)!important;
             }

            /* Hover effect for Firefox view button */
            #TabsToolbar #firefox-view-button:not([open]):hover > .toolbarbutton-icon {
                background-color :var(--tab-hover)!important;
            }

            /* Nav bar button styles */
            #nav-bar toolbarbutton > .toolbarbutton-icon,
            #nav-bar toolbarbutton > .toolbarbutton-badge-stack {
                border-radius :6px;
            }

            /* Nav bar button hover effect */
            #nav-bar toolbarbutton:hover > .toolbarbutton-icon,
            #nav-bar toolbarbutton:hover > .toolbarbutton-badge-stack {
                background-color :var(--blue-highlight)!important;
            }

            /* Back button padding */
            #back-button {
                padding-right :2px!important;
                padding-left :2px!important;
                margin-left :6px!important;
            }

            /* Panel UI menu button styles */
            #PanelUI-menu-button {
                background-color :var(--secondary)!important;
                padding-right :2px!important;
                margin-right :6px!important;
            }
          '';
        };
      };
    };
  };
}
