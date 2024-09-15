{...}: {
  home-manager.users.joy.programs.newsboat = {
    enable = true;
    browser = "firefox";
    urls = [
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCOSqzSTg4QZXdi7jvV-9rUg";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCg6gPGh8HU2U01vaFCAsvmQ";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCYAg4bYdyqENxEyHUX7t1FA";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCVls1GmFKf6WlTraIb_IaJg";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UC5KDiSAFxrDWhmysBcNqtMA";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCcBhwZNKqmPaw3Zk7mh6eBg";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCwnqDLYzLGPbghL9uIOwMnQ";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCRSxdcWjoye7ohD_ibxzYhg";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UChIs72whgZI9w6d6FhwGGHA";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCxdZ7XCQVMRMipj3gGemQfw";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCE_K_gW6ReBi4H3Gp0gi-hg";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCWRHrWUsjdF86dt7NKK2Ixw";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCfeNmPbGRF6dkPt04HIl25A";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCFzUEe9XUlkDLp6AmtNzmOA";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCxBfQGaMuiMyw1dgW-tpZbg";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCpes6DXY4XCSA8s9Q1G9ocg";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCR42P1Uub9py2H5RkdcTnWA";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCtwjD3551TskyUxnfaUw7Rg";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCZpKTYOk5WAdCyMal3J1KHg";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCl2mFZoRqjw_ELax4Yisf6w";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UC2eYFnH61tmytImy1mTYvhA";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UC7YOGHUfC1Tb6E4pudI9STA";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UC0sUzmZ0CHvVCVrpRfGKZfw";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCFFfGA991VRR4U8FNNs72Qg";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCIS-e4W5wK2xG6NbI5Tdm_g";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCKmEAsezQ0kUQ6EC-BtBNbg";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCgj6MvuVmp0JVanAZkFQM5A";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCXQZRyhGN-1F8zwD0a8QuWA";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCohllq0Pk5lQuuNANabHKcg";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCUKU3fl8z2rcK7GBdocd7Ww";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCO57urWt8_T63SPFCA_QmNw";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCtMVHI3AJD4Qk4hcbZnI9ZQ";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UC8ENHE5xdFSwx71u3fDH5Xw";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCMXLdjrQi4JzY0NNvCdUEUQ";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UCEKtvLc3EIS0T7shmgPbVrw";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UC_zBdZ0_H_jn41FDRG7q4Tw";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UChuDUAo3Hfr_0dn54GpwdUQ";
      }
      {
        url = "https://invidious.nerdvpn.de/feed/channel/UClonyx8pReBvkjropmrS6jQ";
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
