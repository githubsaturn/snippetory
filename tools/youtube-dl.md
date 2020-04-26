Ok but problem with fast forwarding:
```
youtube-dl  -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' --output '%(playlist_index)s-%(title)s' https://www.youtube.com/playlist?list=xxxxxxxxxxxx
```


Looking good:
```
youtube-dl  -f 'best' --output '%(playlist_index)s-%(title)s' https://www.youtube.com/playlist?list=xxxxxxxxxxxxxxxxxxx
```




Audio only
```
youtube-dl  --extract-audio --output '%(playlist_index)s-%(title)s' https://www.youtube.com/playlist?list=xxxxxxx-xxxxxxxx

```