The following are nautilus scripts that I use for video editing. 

Convert.sh does the following: takes an input video file, copies the video stream, converts the audio stream to PCM (signed 16-bit little-endian), # and saves the output as an MP4 file.

strip_audio.sh does the following: finds all .mp4 files in the current directory and its subdirectories, and removes the audio stream from each file using ffmpeg. It creates a new file with ".ns.mp4" appended to the original filename.
