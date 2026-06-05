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
          userChrome =
            #css
            ''
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

              .titlebar-buttonbox-container {
                display: none !important;
              }

              hbox.titlebar-spacer {
                display: none !important;
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
                  background-color: var(--url-focus) !important;
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

              toolbar#TabsToolbar:not(:-moz-window-inactive) {
                  background-color: var(--background) !important;
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
                  --tabs-border-add: 0px !important;
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

              #urlbar:not([open]) #urlbar-input-container:focus-within,
              #searchbar:focus-within {
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
              menupop {
                  background-color: var(--url-focus) !important;
              }

              #searchbar:focus-within {
                  outline: none !important;
              }

              :is(panel, menupopup) {
                  --panel-background: var(--url-focus) !important;
                  background: var(--url-focus) !important;
              }

              .urlbarView-body {
                  background-color: var(--url-focus) !important;
              }

              .urlbarView button:hover,
              #searchbar button:hover,
              .urlbarView-row:hover .urlbarView-row-inner,
              .search-autocomplete-richlistbox-popup .autocomplete-richlistitem:hover {
                  background-color: var(--url-bar-item-hover) !important;
                  border-radius: 4px !important;
              }

              .urlbarView-row[type="switchtab"] > span {
                  color: var(--orange-highlight) !important;
              }

              #PopupSearchAutoComplete .autocomplete-richlistitem[selected],
              .searchbar-engine-one-off-item[selected],
              .urlbarView-row[selected],
              .urlbarView-row[aria-selected="true"],
              .urlbarView-row:not([type="tip"], [type="dynamic"])[selected] > .urlbarView-row-inner,
              .urlbarView-row-inner[selected] {
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
                  background-color: var(--tab-hover) !important;
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

              tab:-moz-window-inactive,
              #tabbrowser-tabs:-moz-window-inactive,
              #nav-bar-customization-target {
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

              #urlbar-container {
                  background-color: var(--secondary) !important;
              }

              .urlbarView-row {
                  padding: 4px 0 !important;
              }

              .urlbarView-row-inner {
                  border-radius: 4px !important;
                  padding: 6px !important;
              }

              menupopup,
              popup[type="context"],
              .context-menu-item {
                  background-color: var(--url-focus) !important;
                  color: var(--foreground) !important;
                  border: 1px solid var(--separator) !important;
              }

              menupopup menuitem:hover,
              popup[type="context"] menuitem:hover,
              .context-menu-item:hover {
                  background-color: var(--sidebar-highlight) !important;
                  color: var(--foreground) !important;
              }

              menupopup menu {
                  background-color: var(--url-focus) !important;
                  color: var(--foreground) !important;
              }

              menupopup menu:hover {
                  background-color: var(--sidebar-highlight) !important;
              }

              #sidebar-box,
              #sidebar-header,
              #sidebar-switcher-profile,
              #sidebar-close {
                  background-color: var(--sidebar) !important;
                  color: var(--foreground) !important;
                  border-color: var(--separator) !important;
              }

              #sidebar {
                  background-color: var(--background) !important;
                  color: var(--foreground) !important;
              }

              .sidebar-panel {
                  background-color: var(--background) !important;
                  color: var(--foreground) !important;
              }

              #sidebar button,
              .sidebar-item,
              treechildren::-moz-tree-row {
                  background-color: var(--background) !important;
                  color: var(--foreground) !important;
              }

              #sidebar button:hover,
              .sidebar-item:hover,
              treechildren::-moz-tree-row:hover {
                  background-color: var(--sidebar-button-hover) !important;
              }

              .search-autocomplete-richlistbox,
              .autocomplete-richlistbox,
              .richlistbox {
                  background-color: var(--url-focus) !important;
                  color: var(--foreground) !important;
              }

              .autocomplete-richlistitem,
              richlistitem {
                  background-color: var(--url-focus) !important;
                  color: var(--foreground) !important;
              }

              .autocomplete-richlistitem:hover,
              richlistitem:hover {
                  background-color: var(--sidebar-highlight) !important;
              }

              .autocomplete-richlistitem[selected],
              richlistitem[selected] {
                  background-color: var(--sidebar-highlight) !important;
                  color: var(--foreground) !important;
              }

              .tab-label {
                  color: var(--foreground) !important;
              }

              .tab-label[selected="true"] {
                  color: var(--foreground) !important;
                  font-weight: 500;
              }

              .tabbrowser-tab:hover .tab-label {
                  color: var(--foreground) !important;
              }

              tooltip {
                  background-color: var(--secondary) !important;
                  color: var(--foreground) !important;
                  border: 1px solid var(--separator) !important;
              }

              tooltip description {
                  color: var(--foreground) !important;
              }

              ::selection {
                  background-color: var(--sidebar-highlight) !important;
                  color: var(--foreground) !important;
              }

              ::-moz-selection {
                  background-color: var(--sidebar-highlight) !important;
                  color: var(--foreground) !important;
              }

              treechildren::-moz-tree-cell {
                  background-color: var(--background) !important;
                  color: var(--foreground) !important;
              }

              treechildren::-moz-tree-cell-text {
                  color: var(--foreground) !important;
              }

              treechildren::-moz-tree-row(hover) {
                  background-color: var(--sidebar-button-hover) !important;
              }

              treechildren::-moz-tree-row(selected) {
                  background-color: var(--sidebar-highlight) !important;
              }

              treechildren::-moz-tree-cell-text(selected) {
                  color: var(--foreground) !important;
              }

              scrollbar {
                  background-color: var(--background) !important;
              }

              scrollbarbutton {
                  background-color: var(--secondary) !important;
                  color: var(--foreground) !important;
              }

              scrollbar thumb {
                  background-color: var(--tab-hover) !important;
              }

              scrollbar thumb:hover {
                  background-color: var(--sidebar-button-hover) !important;
              }

              panel {
                  background-color: var(--url-focus) !important;
                  color: var(--foreground) !important;
                  border: 1px solid var(--separator) !important;
                  border-radius: 4px !important;
              }

              menuitem {
                  color: var(--foreground) !important;
              }

              menuitem:hover {
                  background-color: var(--sidebar-highlight) !important;
                  color: var(--foreground) !important;
              }

              menuitem[disabled="true"] {
                  color: var(--separator) !important;
                  opacity: 0.5 !important;
              }
            '';
        };
      };
    };
  };
}
