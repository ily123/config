## Terminal notes

Terminal startup times (smaller is better):
```
Terminal                  Avg      Min      Max
--------                  ---      ---      ---
gnome-terminal           60ms     50ms    137ms
alacritty                66ms     64ms     72ms
kitty                   131ms    126ms    136ms
ghostty                 211ms    203ms    219ms
```

Notes:
- Raw command `time <terminal> -e /bin/true`
- Benchmark script `./bench_terminal_startup`
- Gnome is fast because it runs a persistent background service, cold start is 130ms

Alacritty config docs:
- https://alacritty.org/config-alacritty.html
