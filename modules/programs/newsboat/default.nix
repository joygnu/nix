{
  programs.newsboat = {
    enable = true;
    browser = "firefox";
    urls = [
      {
        url = "https://yt.joygnu.org/feed/channel/UCOSqzSTg4QZXdi7jvV-9rUg";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCg6gPGh8HU2U01vaFCAsvmQ";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCYAg4bYdyqENxEyHUX7t1FA";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCVls1GmFKf6WlTraIb_IaJg";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UC5KDiSAFxrDWhmysBcNqtMA";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCcBhwZNKqmPaw3Zk7mh6eBg";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCwnqDLYzLGPbghL9uIOwMnQ";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCRSxdcWjoye7ohD_ibxzYhg";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UChIs72whgZI9w6d6FhwGGHA";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCxdZ7XCQVMRMipj3gGemQfw";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UC0L2SuL6AK_xtmx82hbqcTw";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCE_K_gW6ReBi4H3Gp0gi-hg";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCWRHrWUsjdF86dt7NKK2Ixw";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCfeNmPbGRF6dkPt04HIl25A";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCFzUEe9XUlkDLp6AmtNzmOA";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCxBfQGaMuiMyw1dgW-tpZbg";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCpes6DXY4XCSA8s9Q1G9ocg";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCR42P1Uub9py2H5RkdcTnWA";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCtwjD3551TskyUxnfaUw7Rg";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCZpKTYOk5WAdCyMal3J1KHg";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCl2mFZoRqjw_ELax4Yisf6w";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UC2eYFnH61tmytImy1mTYvhA";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UC7YOGHUfC1Tb6E4pudI9STA";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UC0sUzmZ0CHvVCVrpRfGKZfw";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCFFfGA991VRR4U8FNNs72Qg";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCIS-e4W5wK2xG6NbI5Tdm_g";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCKmEAsezQ0kUQ6EC-BtBNbg";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCgj6MvuVmp0JVanAZkFQM5A";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCXQZRyhGN-1F8zwD0a8QuWA";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCohllq0Pk5lQuuNANabHKcg";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCUKU3fl8z2rcK7GBdocd7Ww";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCO57urWt8_T63SPFCA_QmNw";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCE972BOwKeCHsgfKV3NxEZA";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCtMVHI3AJD4Qk4hcbZnI9ZQ";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UC8ENHE5xdFSwx71u3fDH5Xw";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCMXLdjrQi4JzY0NNvCdUEUQ";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UCEKtvLc3EIS0T7shmgPbVrw";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UC_zBdZ0_H_jn41FDRG7q4Tw";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UChuDUAo3Hfr_0dn54GpwdUQ";
      }
      {
        url = "https://yt.joygnu.org/feed/channel/UClonyx8pReBvkjropmrS6jQ";
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
      macro o set browser "setsid -f mpv --no-terminal %u &" ; open-in-browser ; set browser "elinks %u"

      color background          color15   color0
      color listnormal          color15   color0
      color listnormal_unread   color15   color0 bold
      color listfocus           color4    color8
      color listfocus_unread    color4    color8 bold
      color info                color15   color8
      color article             color15   color0

      highlight article "https?://[^ ]+" blue default underline
    '';
  };
}