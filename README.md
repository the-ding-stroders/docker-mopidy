# docker-mopidy
Runs [Mopidy](https://mopidy.com/), plus various extensions, in a Docker container. The image plays bitperfect using alsa devices.
Pulseaudio is not needed.
 
# Included Plugins
- [Mopidy-Local](https://mopidy.com/ext/local/)
- [Mopidy-MPD](https://mopidy.com/ext/mpd/)
- [Mopidy-ALSAMixer](https://mopidy.com/ext/alsamixer/)

# Run
    docker run -d  --name mopidy --net host --device /dev/snd  \
               -v ~/.config:/root/.config  \
               -v /data/music:/data/music thedingstroders/mopidy

# Buildx

Using buildx, it is possible to build a multi-platform image that runs on arm7 (Raspberry Pi, Odroid etc.), as well as on amd64 (x86 architecture):

    docker buildx build --platform linux/amd64,linux/arm/v7 --push -t thedingstroders/mopidy:latest .

Docker picks the correct image based on the node's platform.
