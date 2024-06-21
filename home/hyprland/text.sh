grim -g "$(slurp)" - | convert - pnm:- | tesseract stdin stdout | wl-copy

