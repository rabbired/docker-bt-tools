# subfinder / 容器化字幕查找器 
https://github.com/subfinder/subfinder
# and
# Auto Remove Torrents / 自动删种程序
https://github.com/jerrymakesjelly/autoremove-torrents

## Run docker command / 运行docker指令

```
docker run -d \
-e SUBFIND_DIR=/movie_dir \
-e CONFIG_DIR="path/to/config.yml" \
-v "/path/to/yourfolder:/movie_dir" \
rabbired/subfinder
```

## or

```
docker run --rm -v "/path/to/yourfolder:/movie_dir" rabbired/subfinder subfinder --help
docker run --rm -v "/path/to/yourfolder:/movie_dir" rabbired/subfinder autoremove-torrents --help
```
