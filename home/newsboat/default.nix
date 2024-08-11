{ ... }:

{
  programs.newsboat =  {
    enable = true;
    browser = "firefox";
    urls = [
      {
        url = "https://www.youtube.com/channel/UCg6gPGh8HU2U01vaFCAsvmQ";
      }
      {
        url = "https://www.youtube.com/channel/UCYAg4bYdyqENxEyHUX7t1FA";
      }
      {
        url = "https://www.youtube.com/channel/UCVls1GmFKf6WlTraIb_IaJg";
      }
      {
        url = "https://www.youtube.com/channel/UC5KDiSAFxrDWhmysBcNqtMA";
      }
      {
        url = "https://www.youtube.com/channel/UCcBhwZNKqmPaw3Zk7mh6eBg";
      }
      {
        url = "https://www.youtube.com/channel/UCwnqDLYzLGPbghL9uIOwMnQ";
      }
      {
        url = "https://www.youtube.com/channel/UCRSxdcWjoye7ohD_ibxzYhg";
      }
      {
        url = "https://www.youtube.com/channel/UChIs72whgZI9w6d6FhwGGHA";
      }
      {
        url = "https://www.youtube.com/channel/UCE_K_gW6ReBi4H3Gp0gi-hg";
      }
      {
        url = "https://www.youtube.com/channel/UCWRHrWUsjdF86dt7NKK2Ixw";
      }
      {
        url = "https://www.youtube.com/channel/UCFzUEe9XUlkDLp6AmtNzmOA";
      }
      {
        url = "https://www.youtube.com/channel/UCxBfQGaMuiMyw1dgW-tpZbg";
      }
      {
        url = "https://www.youtube.com/channel/UCpes6DXY4XCSA8s9Q1G9ocg";
      }
      {
        url = "https://www.youtube.com/channel/UCR42P1Uub9py2H5RkdcTnWA";
      }
      {
        url = "https://www.youtube.com/channel/UCtwjD3551TskyUxnfaUw7Rg";
      }
      {
        url = "https://www.youtube.com/channel/UCZpKTYOk5WAdCyMal3J1KHg";
      }
      {
        url = "https://www.youtube.com/channel/UCl2mFZoRqjw_ELax4Yisf6w";
      }
      {
        url = "https://www.youtube.com/channel/UC2eYFnH61tmytImy1mTYvhA";
      }
      {
        url = "https://www.youtube.com/channel/UC7YOGHUfC1Tb6E4pudI9STA";
      }
      {
        url = "https://www.youtube.com/channel/UC0sUzmZ0CHvVCVrpRfGKZfw";
      }
      {
        url = "https://www.youtube.com/channel/UCFFfGA991VRR4U8FNNs72Qg";
      }
      {
        url = "https://www.youtube.com/channel/UCIS-e4W5wK2xG6NbI5Tdm_g";
      }
      {
        url = "https://www.youtube.com/channel/UCKmEAsezQ0kUQ6EC-BtBNbg";
      }
      {
        url = "https://www.youtube.com/channel/UCgj6MvuVmp0JVanAZkFQM5A";
      }
      {
        url = "https://www.youtube.com/channel/UCXQZRyhGN-1F8zwD0a8QuWA";
      }
      {
        url = "https://www.youtube.com/channel/UCohllq0Pk5lQuuNANabHKcg";
      }
      {
        url = "https://www.youtube.com/channel/UCUKU3fl8z2rcK7GBdocd7Ww";
      }
      {
        url = "https://www.youtube.com/channel/UCO57urWt8_T63SPFCA_QmNw";
      }
      {
        url = "https://www.youtube.com/channel/UCtMVHI3AJD4Qk4hcbZnI9ZQ";
      }
      {
        url = "https://www.youtube.com/channel/UC8ENHE5xdFSwx71u3fDH5Xw";
      }
      {
        url = "https://www.youtube.com/channel/UCMXLdjrQi4JzY0NNvCdUEUQ";
      }
      {
        url = "https://www.youtube.com/channel/UCEKtvLc3EIS0T7shmgPbVrw";
      }
      {
        url = "https://www.youtube.com/channel/UC_zBdZ0_H_jn41FDRG7q4Tw";
      }
      {
        url = "https://www.youtube.com/channel/UChuDUAo3Hfr_0dn54GpwdUQ";
      }
      {
        url = "https://www.youtube.com/channel/UClonyx8pReBvkjropmrS6jQ";
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
