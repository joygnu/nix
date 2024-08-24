{...}: {
  programs.newsboat = {
    enable = true;
    browser = "firefox";
    urls = [
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCg6gPGh8HU2U01vaFCAsvmQ";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCYAg4bYdyqENxEyHUX7t1FA";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCVls1GmFKf6WlTraIb_IaJg";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UC5KDiSAFxrDWhmysBcNqtMA";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCcBhwZNKqmPaw3Zk7mh6eBg";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCwnqDLYzLGPbghL9uIOwMnQ";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCRSxdcWjoye7ohD_ibxzYhg";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UChIs72whgZI9w6d6FhwGGHA";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCE_K_gW6ReBi4H3Gp0gi-hg";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCWRHrWUsjdF86dt7NKK2Ixw";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCFzUEe9XUlkDLp6AmtNzmOA";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCxBfQGaMuiMyw1dgW-tpZbg";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCpes6DXY4XCSA8s9Q1G9ocg";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCR42P1Uub9py2H5RkdcTnWA";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCtwjD3551TskyUxnfaUw7Rg";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCZpKTYOk5WAdCyMal3J1KHg";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCl2mFZoRqjw_ELax4Yisf6w";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UC2eYFnH61tmytImy1mTYvhA";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UC7YOGHUfC1Tb6E4pudI9STA";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UC0sUzmZ0CHvVCVrpRfGKZfw";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCFFfGA991VRR4U8FNNs72Qg";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCIS-e4W5wK2xG6NbI5Tdm_g";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCKmEAsezQ0kUQ6EC-BtBNbg";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCgj6MvuVmp0JVanAZkFQM5A";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCXQZRyhGN-1F8zwD0a8QuWA";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCohllq0Pk5lQuuNANabHKcg";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCUKU3fl8z2rcK7GBdocd7Ww";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCO57urWt8_T63SPFCA_QmNw";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCtMVHI3AJD4Qk4hcbZnI9ZQ";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UC8ENHE5xdFSwx71u3fDH5Xw";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCMXLdjrQi4JzY0NNvCdUEUQ";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCEKtvLc3EIS0T7shmgPbVrw";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UC_zBdZ0_H_jn41FDRG7q4Tw";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UChuDUAo3Hfr_0dn54GpwdUQ";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UClonyx8pReBvkjropmrS6jQ";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCOSqzSTg4QZXdi7jvV-9rUg";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCXQZRyhGN-1F8zwD0a8QuWA";
      }
      {
        url = "https://invidious.reallyaweso.me/feed/channel/UCxdZ7XCQVMRMipj3gGemQfw";
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
      macro c set browser "setsid -f mpv --no-terminal %u &" ; open-in-browser ; set browser "elinks %u"    '';
  };
}
