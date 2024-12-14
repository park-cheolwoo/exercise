# pip install yt-dlp
# ffmpeg :: https://ffmpeg.org/download.html?form=MG0AV3
from yt_dlp import YoutubeDL

# 다운로드 경로와 파일명 설정
ydl_opts = {
    "format": "bestvideo[ext=mp4][height<=1080]+bestaudio[ext=mp4]",
    "outtmpl": "D:/video/source/%(title)s.mp4",  # 저장할 경로와 파일명 형식
    "merge_output_format": "mp4",
    "ffmpeg_location": "D:\workspace\summary\Youtube\ffmpeg.exe",
    "postprocessors": [
        {"key": "FFmpegMetadata", "add_metadata": True},  # 메타데이터 추가
    ],
}
while True:
    url = input("다운로드할 링크 입력 >> ")
    if url == "0":
        break
    else:
        with YoutubeDL(ydl_opts) as ydl:
            ydl.download([url])


# python youtube.py
