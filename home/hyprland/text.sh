grim -g "$(slurp)" - | convert - pnm:- | gocr - -o - | wl-copy
