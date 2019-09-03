# subfinder/容器化字幕查找器 and 

# Run docker command / 运行docker指令

docker run -d -e SUBFIND_DIR=/movie_dir -v "/path/to/yourfolder:/movie_dir" rabbired/subfinder

# or

docker run --rm -v "/path/to/yourfolder:/movie_dir" rabbired/subfinder subfinder "/movie_dir" -l "" -m ""
# docker-bt-tools
