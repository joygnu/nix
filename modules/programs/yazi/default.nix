{
  programs.yazi = {
    enable = true;
    settings = {
      opener = {
        edit = [
          {
            run = "hx \"$@\"";
            block = true;
            for = "unix";
          }
        ];
      };
    };
  };
}
