{
  programs.newsboat = {
    enable = true;
    browser = "firefox";
    urls = [
      {
        url = "http://localhost:3000/feed/channel/UCOSqzSTg4QZXdi7jvV-9rUg";
      }
      {
        url = "http://localhost:3000/feed/channel/UCg6gPGh8HU2U01vaFCAsvmQ";
      }
      {
        url = "http://localhost:3000/feed/channel/UCYAg4bYdyqENxEyHUX7t1FA";
      }
      {
        url = "http://localhost:3000/feed/channel/UCVls1GmFKf6WlTraIb_IaJg";
      }
      {
        url = "http://localhost:3000/feed/channel/UC5KDiSAFxrDWhmysBcNqtMA";
      }
      {
        url = "http://localhost:3000/feed/channel/UCcBhwZNKqmPaw3Zk7mh6eBg";
      }
      {
        url = "http://localhost:3000/feed/channel/UCwnqDLYzLGPbghL9uIOwMnQ";
      }
      {
        url = "http://localhost:3000/feed/channel/UCRSxdcWjoye7ohD_ibxzYhg";
      }
      {
        url = "http://localhost:3000/feed/channel/UChIs72whgZI9w6d6FhwGGHA";
      }
      {
        url = "http://localhost:3000/feed/channel/UCxdZ7XCQVMRMipj3gGemQfw";
      }
      {
        url = "http://localhost:3000/feed/channel/UC0L2SuL6AK_xtmx82hbqcTw";
      }
      {
        url = "http://localhost:3000/feed/channel/UCE_K_gW6ReBi4H3Gp0gi-hg";
      }
      {
        url = "http://localhost:3000/feed/channel/UCWRHrWUsjdF86dt7NKK2Ixw";
      }
      {
        url = "http://localhost:3000/feed/channel/UCfeNmPbGRF6dkPt04HIl25A";
      }
      {
        url = "http://localhost:3000/feed/channel/UCFzUEe9XUlkDLp6AmtNzmOA";
      }
      {
        url = "http://localhost:3000/feed/channel/UCxBfQGaMuiMyw1dgW-tpZbg";
      }
      {
        url = "http://localhost:3000/feed/channel/UCpes6DXY4XCSA8s9Q1G9ocg";
      }
      {
        url = "http://localhost:3000/feed/channel/UCR42P1Uub9py2H5RkdcTnWA";
      }
      {
        url = "http://localhost:3000/feed/channel/UCtwjD3551TskyUxnfaUw7Rg";
      }
      {
        url = "http://localhost:3000/feed/channel/UCZpKTYOk5WAdCyMal3J1KHg";
      }
      {
        url = "http://localhost:3000/feed/channel/UCl2mFZoRqjw_ELax4Yisf6w";
      }
      {
        url = "http://localhost:3000/feed/channel/UC2eYFnH61tmytImy1mTYvhA";
      }
      {
        url = "http://localhost:3000/feed/channel/UC7YOGHUfC1Tb6E4pudI9STA";
      }
      {
        url = "http://localhost:3000/feed/channel/UC0sUzmZ0CHvVCVrpRfGKZfw";
      }
      {
        url = "http://localhost:3000/feed/channel/UCFFfGA991VRR4U8FNNs72Qg";
      }
      {
        url = "http://localhost:3000/feed/channel/UCIS-e4W5wK2xG6NbI5Tdm_g";
      }
      {
        url = "http://localhost:3000/feed/channel/UCKmEAsezQ0kUQ6EC-BtBNbg";
      }
      {
        url = "http://localhost:3000/feed/channel/UCgj6MvuVmp0JVanAZkFQM5A";
      }
      {
        url = "http://localhost:3000/feed/channel/UCXQZRyhGN-1F8zwD0a8QuWA";
      }
      {
        url = "http://localhost:3000/feed/channel/UCohllq0Pk5lQuuNANabHKcg";
      }
      {
        url = "http://localhost:3000/feed/channel/UCUKU3fl8z2rcK7GBdocd7Ww";
      }
      {
        url = "http://localhost:3000/feed/channel/UCO57urWt8_T63SPFCA_QmNw";
      }
      {
        url = "http://localhost:3000/feed/channel/UCE972BOwKeCHsgfKV3NxEZA";
      }
      {
        url = "http://localhost:3000/feed/channel/UCtMVHI3AJD4Qk4hcbZnI9ZQ";
      }
      {
        url = "http://localhost:3000/feed/channel/UC8ENHE5xdFSwx71u3fDH5Xw";
      }
      {
        url = "http://localhost:3000/feed/channel/UCMXLdjrQi4JzY0NNvCdUEUQ";
      }
      {
        url = "http://localhost:3000/feed/channel/UCEKtvLc3EIS0T7shmgPbVrw";
      }
      {
        url = "http://localhost:3000/feed/channel/UC_zBdZ0_H_jn41FDRG7q4Tw";
      }
      {
        url = "http://localhost:3000/feed/channel/UChuDUAo3Hfr_0dn54GpwdUQ";
      }
      {
        url = "http://localhost:3000/feed/channel/UClonyx8pReBvkjropmrS6jQ";
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
      color listfocus           color15   color4
      color listfocus_unread    color15   color4  bold
      color info                color15   color8
      color article             color15   color0

      highlight article "https?://[^ ]+" blue default underline
    '';
  };
}
