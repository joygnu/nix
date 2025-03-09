{
  domain,
  username,
  ...
}: {
  home-manager.users.${username} = {
    programs.newsboat = {
      enable = true;
      browser = "firefox";
      urls = [
        {
          url = "https://yt.${domain}/feed/channel/UCOSqzSTg4QZXdi7jvV-9rUg";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCg6gPGh8HU2U01vaFCAsvmQ";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCYAg4bYdyqENxEyHUX7t1FA";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCVls1GmFKf6WlTraIb_IaJg";
        }
        {
          url = "https://yt.${domain}/feed/channel/UC5KDiSAFxrDWhmysBcNqtMA";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCcBhwZNKqmPaw3Zk7mh6eBg";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCwnqDLYzLGPbghL9uIOwMnQ";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCRSxdcWjoye7ohD_ibxzYhg";
        }
        {
          url = "https://yt.${domain}/feed/channel/UChIs72whgZI9w6d6FhwGGHA";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCxdZ7XCQVMRMipj3gGemQfw";
        }
        {
          url = "https://yt.${domain}/feed/channel/UC0L2SuL6AK_xtmx82hbqcTw";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCE_K_gW6ReBi4H3Gp0gi-hg";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCWRHrWUsjdF86dt7NKK2Ixw";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCfeNmPbGRF6dkPt04HIl25A";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCFzUEe9XUlkDLp6AmtNzmOA";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCxBfQGaMuiMyw1dgW-tpZbg";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCpes6DXY4XCSA8s9Q1G9ocg";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCR42P1Uub9py2H5RkdcTnWA";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCtwjD3551TskyUxnfaUw7Rg";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCZpKTYOk5WAdCyMal3J1KHg";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCl2mFZoRqjw_ELax4Yisf6w";
        }
        {
          url = "https://yt.${domain}/feed/channel/UC2eYFnH61tmytImy1mTYvhA";
        }
        {
          url = "https://yt.${domain}/feed/channel/UC7YOGHUfC1Tb6E4pudI9STA";
        }
        {
          url = "https://yt.${domain}/feed/channel/UC0sUzmZ0CHvVCVrpRfGKZfw";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCFFfGA991VRR4U8FNNs72Qg";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCIS-e4W5wK2xG6NbI5Tdm_g";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCKmEAsezQ0kUQ6EC-BtBNbg";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCgj6MvuVmp0JVanAZkFQM5A";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCXQZRyhGN-1F8zwD0a8QuWA";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCohllq0Pk5lQuuNANabHKcg";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCUKU3fl8z2rcK7GBdocd7Ww";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCO57urWt8_T63SPFCA_QmNw";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCE972BOwKeCHsgfKV3NxEZA";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCtMVHI3AJD4Qk4hcbZnI9ZQ";
        }
        {
          url = "https://yt.${domain}/feed/channel/UC8ENHE5xdFSwx71u3fDH5Xw";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCMXLdjrQi4JzY0NNvCdUEUQ";
        }
        {
          url = "https://yt.${domain}/feed/channel/UCEKtvLc3EIS0T7shmgPbVrw";
        }
        {
          url = "https://yt.${domain}/feed/channel/UC_zBdZ0_H_jn41FDRG7q4Tw";
        }
        {
          url = "https://yt.${domain}/feed/channel/UChuDUAo3Hfr_0dn54GpwdUQ";
        }
        {
          url = "https://yt.${domain}/feed/channel/UClonyx8pReBvkjropmrS6jQ";
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
  };
}
