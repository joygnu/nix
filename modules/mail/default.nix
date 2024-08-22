{...}:{
systemd.services.email-sync = {
  description = "Service to sync emails";
  serviceConfig = {
    ExecStart = "mw -Y";  
    User = "joy";  
    Group = "users";    
  };
  wantedBy = [ "multi-user.target" ];
};

systemd.timers.email-sync = {
  description = "Timer to run email sync every 10 minutes";
  timerConfig = {
    OnBootSec = "1min";         
    OnUnitActiveSec = "10min";  
  };
  wants = [ "email-sync.service" ];
  unit = "email-sync.service";
};
}
