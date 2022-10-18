FROM codewithweeb/weebzone:stable
# FROM private69/mltb:heroku

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt -qq update --fix-missing && \
    apt -qq install -y \
    mediainfo

COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt
RUN apt-get update && apt-get upgrade -y

RUN pip3 install aria2p && pip3 install qbittorrent-api && pip3 install ffmpeg && pip3 install yt-dlp

CMD ["bash", "start.sh"]
