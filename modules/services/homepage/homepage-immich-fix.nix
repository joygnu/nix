final: prev: {
  homepage-dashboard = prev.homepage-dashboard.overrideAttrs (old: {
    postInstall =
      (old.postInstall or "")
      + ''
        # Fix Immich widget to use v2 API routes (compatible with Immich v2.7.5+)
        find $out/share/homepage/.next -name "*.js" -exec \
          sed -i \
            's|endpoint:"server-info/stats"|endpoint:"server/statistics"|g' \
            {} \;
        find $out/share/homepage/.next -name "*.js" -exec \
          sed -i \
            's|endpoint:"server-info/statistics"|endpoint:"server/statistics"|g' \
            {} \;
        find $out/share/homepage/.next -name "*.js" -exec \
          sed -i \
            's|endpoint:"server-info/version"|endpoint:"server/about"|g' \
            {} \;
      '';
  });
}
