{ ... }:
{
  programs.newsboat =  {
    enable = true;
    browser = "firefox";
    urls = [
      {
        url = "https://vkc.sh/feed/";
      }
      {
        url = "https://lukesmith.xyz/rss.xml";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA";
      }
    ];
    extraConfig = "
bind-key j down
bind-key k up
    ";
  };
}
