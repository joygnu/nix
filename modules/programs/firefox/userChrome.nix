{
  username,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.firefox.enable {
    home-manager.users.${username} = {
      programs.firefox = {
        profiles.${username} = {
          userChrome = ''
            .titlebar-buttonbox-container {
              display: none !important;
            }

            hbox.titlebar-spacer {
              display: none !important;
            }

            :root {
              --background: #${config.home-manager.users.${username}.stylix.base16Scheme.base01};
              --secondary: #${config.home-manager.users.${username}.stylix.base16Scheme.base00};
              --foreground: #${config.home-manager.users.${username}.stylix.base16Scheme.base05};
              --orange-highlight: #${config.home-manager.users.${username}.stylix.base16Scheme.base09};
              --sound-border: #${config.home-manager.users.${username}.stylix.base16Scheme.base0E};
              --separator: #${config.home-manager.users.${username}.stylix.base16Scheme.base03};
              --tab-hover: #${config.home-manager.users.${username}.stylix.base16Scheme.base02};
              --tab-btn-hover: #${config.home-manager.users.${username}.stylix.base16Scheme.base02};
              --toolbar-btn-hover: #${config.home-manager.users.${username}.stylix.base16Scheme.base03};
              --url-bar: #${config.home-manager.users.${username}.stylix.base16Scheme.base01};
              --url-focus: #${config.home-manager.users.${username}.stylix.base16Scheme.base01};
              --url-bar-item-hover: #${config.home-manager.users.${username}.stylix.base16Scheme.base03};
              --sidebar: #${config.home-manager.users.${username}.stylix.base16Scheme.base01};
              --sidebar-button-hover: #${config.home-manager.users.${username}.stylix.base16Scheme.base04};
              --sidebar-highlight: #${config.home-manager.users.${username}.stylix.base16Scheme.base0D};
              --toolbar-bgcolor: var(--secondary) !important;
              --tab: var(--background);
              --tab-btn: var(--tab-inactive);
              --tab-inactive: var(--secondary);
              --tab-btn-inactive: var(--tab-inactive);
            }

            .panel-arrowcontainer {
                background-color: var(--secondary) !important;
            }

            #PopupAutoComplete, #PopupSearchAutoComplete, panelview {
                background-color: var(--url-focus) !important;
                color: var(--foreground) !important;
            }

            panel[type="autocomplete-richlistbox"] {
                --panel-background: none !important;
                border-radius: 4px !important;
                color: var(--foreground) !important;
            }

            toolbarseparator, menuseparator {
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

            #titlebar, #titlebar-spacer, #titlebar-buttonbox-container {
                background-color: var(--background) !important;
                border: none !important;
            }

            #navigator-toolbox {
                --tabs-border-color: var(--orange-highlight) !important;
                border: none !important;
            }

            #navigator-toolbox::after {
                border-bottom: 0px !important;
            }

            #urlbar, #searchbar {
                box-shadow: none !important;
                border: none !important;
                border-radius: 4px;
                color: var(--foreground) !important;
                background-color: var(--url-bar) !important;
                --autocomplete-popup-separator-color: var(--separator) !important;
            }

            #urlbar-input, #urlbar-input-container {
                color: var(--foreground) !important;
                background-color: var(--url-bar) !important;
            }

            #urlbar:not([open]) #urlbar-input-container:focus-within, #searchbar:focus-within {
                border: 2px solid var(--orange-highlight) !important;
            }

            #urlbar:focus-within, #urlbar[open], #urlbar[open] #urlbar-input-container, #urlbar[open] #urlbar-input, #urlbar-input-container:focus-within, #urlbar-input:focus, #urlbar-background, .urlbarView, #searchbar:focus-within, menupop {
                background-color: var(--url-focus) !important;
            }

            #searchbar:focus-within {
                outline: none !important;
            }

            :is(panel, menupopup)::part(content) {
                background: none !important;
            }

            .urlbarView button:hover, #searchbar button:hover, .urlbarView-row:hover .urlbarView-row-inner, .search-autocomplete-richlistbox-popup .autocomplete-richlistitem:hover {
                background-color: var(--url-bar-item-hover) !important;
            }

            .urlbarView-row[type="switchtab"] > span {
                color: var(--orange-highlight) !important;
            }

            #PopupSearchAutoComplete .autocomplete-richlistitem[selected], .searchbar-engine-one-off-item[selected], .urlbarView-row[selected], .urlbarView-row[aria-selected="true"], .urlbarView-row:not([type="tip"], [type="dynamic"])[selected] > .urlbarView-row-inner, .urlbarView-row-inner[selected] {
                color: var(--foreground) !important;
                background-color: var(--sidebar-highlight) !important;
                border-radius: 4px !important;
            }

            #PersonalToolbar {
                background-color: var(--secondary) !important;
            }

            .tab-background[selected="true"] {
                background-color: transparent !important;
                background-image: none !important;
            }

            .tabbrowser-tab:hover > .tab-stack > .tab-background:not([selected="true"]):not([multiselected]) {
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

            tab, #tabbrowser-tabs {
                background-color: var(--background) !important;
                color: var(--foreground) !important;
            }

            tab:-moz-window-inactive, #tabbrowser-tabs:-moz-window-inactive, #nav-bar-customization-target {
                background-color: var(--secondary) !important;
            }

            .tabbrowser-tab[selected] {
                opacity: 1;
            }

            .tab-loading-burst {
                background-color: inherit;
            }

            .tab-content {
                border-radius: 4px;
                margin: 5px 0px 5px 0px !important;
                border: 1px solid transparent !important;
            }

            .tab-content[selected="true"] {
                background-color: var(--secondary) !important;
                color: var(--foreground) !important;
                border: 1px solid var(--orange-highlight) !important;
            }

            .tab-content:not([selected="true"]):hover {
                background-color: var(--tab-hover) !important;
            }

            toolbarbutton {
                fill: var(--foreground) !important;
                background-color: transparent !important;
            }

            #TabsToolbar toolbarbutton {
                border-radius: 4px;
                border: 1px solid transparent !important;
            }

            #TabsToolbar #firefox-view-button > .toolbarbutton-icon {
                background-image: none !important;
                border-radius: 4px;
            }

            #TabsToolbar #firefox-view-button[open] > .toolbarbutton-icon {
                background-color: var(--secondary) !important;
                color: var(--foreground) !important;
                padding: 9px !important;
                border: 1px solid var(--orange-highlight) !important;
            }

            #TabsToolbar #firefox-view-button:not([open]):hover > .toolbarbutton-icon {
                background-color: var(--tab-hover) !important;
            }

            #nav-bar toolbarbutton > .toolbarbutton-icon, #nav-bar toolbarbutton > .toolbarbutton-badge-stack {
                border-radius: 6px;
            }

            #nav-bar toolbarbutton:hover > .toolbarbutton-icon, #nav-bar toolbarbutton:hover > .toolbarbutton-badge-stack {
                background-color: var(--toolbar-btn-hover) !important;
            }

            #back-button {
                padding-right: 2px !important;
                padding-left: 2px !important;
                margin-left: 6px !important;
            }

            #PanelUI-menu-button {
                background-color: var(--secondary) !important;
                padding-right: 2px !important;
                margin-right: 6px !important;
            }

            #PersonalToolbar toolbarbutton {
                margin: 3px 0px 3px 3px !important;
                border-radius: 4px;
            }

            #PersonalToolbar toolbarbutton:hover {
                background-color: var(--toolbar-btn-hover) !important;
            }
          '';
        };
      };
    };
  };
}
