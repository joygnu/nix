{pkgs,...}:{
  services.swaync = {
    enable = true;
    style = 
      ''
       .notification-row {
          outline: none;
        }
        
        .notification-row:focus,
        .notification-row:hover {
          background: @noti-bg-focus;
        }
        
        .notification {
          border-radius: 12px;
          margin: 6px 12px;
          box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 3px 1px rgba(0, 0, 0, 0.7),
            0 2px 6px 2px rgba(0, 0, 0, 0.3);
          padding: 0;
        }
        ''
      ;
    };

  home.packages = with pkgs; [
  libnotify
  ];
}
