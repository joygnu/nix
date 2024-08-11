{ ... }:
{
  programs.newsboat =  {
    enable = true;
    browser = "firefox";
    urls = [
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA";
      }
    ];
    extraConfig = ''
      bind-key j down
      bind-key k up
      bind-key j next articlelist
      bind-key k prev articlelist
      bind-key ge end
      bind-key gg home
      bind-key l open
      bind-key h quit
      macro y set browser "mpv %u" ; open-in-browser ; set browser "elinks %u"
    '';
  };
}
