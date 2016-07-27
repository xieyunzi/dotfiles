How-to-select-video-quality-from-youtube-dl
-------------------------------------------

To download a video, you type the URL after the command like so:

    youtube-dl "http://www.youtube.com/watch?v=P9pzm5b6FFY"

**To select the video quality**, first use the `-F` option to list the available formats, here’s an example,

    youtube-dl -F "http://www.youtube.com/watch?v=P9pzm5b6FFY"

Here’s the output:

    [youtube] Setting language
    [youtube] P9pzm5b6FFY: Downloading webpage
    [youtube] P9pzm5b6FFY: Downloading video info webpage
    [youtube] P9pzm5b6FFY: Extracting video information
    [info] Available formats for P9pzm5b6FFY:
    format code extension resolution  note
    140         m4a       audio only  DASH audio , audio@128k (worst)
    160         mp4       144p        DASH video , video only
    133         mp4       240p        DASH video , video only
    134         mp4       360p        DASH video , video only
    135         mp4       480p        DASH video , video only
    136         mp4       720p        DASH video , video only
    17          3gp       176x144
    36          3gp       320x240
    5           flv       400x240
    43          webm      640x360
    18          mp4       640x360
    22          mp4       1280x720    (best)

**The best quality is 22** so use `-f 22` instead of `-F` to download the MP4 video with 1280x720 resolution like this:

    youtube-dl -f 22 "http://www.youtube.com/watch?v=P9pzm5b6FFY"

 **Or** optionally use the following flags to automatically download the best audio and video tracks available:

    youtube-dl -f bestvideo+bestaudio "http://www.youtube.com/watch?v=P9pzm5b6FFY"

If you encounter an error during the muxing process, instead try the following:

    youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "http://www.youtube.com/watch?v=P9pzm5b6FFY"

That command will ensure you download the highest quality mp4 video and m4a audio from the video and merge them back into a single mp4 (using ffmpeg in my case).

Source: http://www.webupd8.org/2014/02/video-downloader-youtube-dl-gets.html

[Anwser from](http://askubuntu.com/questions/486297/how-to-select-video-quality-from-youtube-dl)
