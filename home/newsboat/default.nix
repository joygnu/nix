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
    ];
  };
}
