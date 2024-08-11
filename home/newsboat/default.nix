{ ... }:
{
  programs.newsboat =  {
    enable = true;
    browser = "firefox";
    urls = [
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCg6gPGh8HU2U01vaFCAsvmQ";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCYAg4bYdyqENxEyHUX7t1FA";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCVls1GmFKf6WlTraIb_IaJg";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC5KDiSAFxrDWhmysBcNqtMA";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCcBhwZNKqmPaw3Zk7mh6eBg";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCwnqDLYzLGPbghL9uIOwMnQ";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCRSxdcWjoye7ohD_ibxzYhg";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UChIs72whgZI9w6d6FhwGGHA";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCE_K_gW6ReBi4H3Gp0gi-hg";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCWRHrWUsjdF86dt7NKK2Ixw";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCFzUEe9XUlkDLp6AmtNzmOA";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCxBfQGaMuiMyw1dgW-tpZbg";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCpes6DXY4XCSA8s9Q1G9ocg";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCR42P1Uub9py2H5RkdcTnWA";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCtwjD3551TskyUxnfaUw7Rg";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCZpKTYOk5WAdCyMal3J1KHg";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCl2mFZoRqjw_ELax4Yisf6w";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC7YOGHUfC1Tb6E4pudI9STA";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC0sUzmZ0CHvVCVrpRfGKZfw";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCFFfGA991VRR4U8FNNs72Qg";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCIS-e4W5wK2xG6NbI5Tdm_g";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCKmEAsezQ0kUQ6EC-BtBNbg";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCgj6MvuVmp0JVanAZkFQM5A";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCXQZRyhGN-1F8zwD0a8QuWA";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCohllq0Pk5lQuuNANabHKcg";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCUKU3fl8z2rcK7GBdocd7Ww";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCO57urWt8_T63SPFCA_QmNw";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCtMVHI3AJD4Qk4hcbZnI9ZQ";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC8ENHE5xdFSwx71u3fDH5Xw";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCMXLdjrQi4JzY0NNvCdUEUQ";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCEKtvLc3EIS0T7shmgPbVrw";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC_zBdZ0_H_jn41FDRG7q4Tw";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UChuDUAo3Hfr_0dn54GpwdUQ";
      }
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UClonyx8pReBvkjropmrS6jQ";
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
