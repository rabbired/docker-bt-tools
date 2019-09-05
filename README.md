# flexget
# subfinder / 字幕查找器
https://github.com/ausaki/subfinder
# Auto Remove Torrents / 自动删种程序
https://github.com/jerrymakesjelly/autoremove-torrents

### Run docker command / 运行docker指令

```
docker run -d \
-e SUB_DIR="/movie_dir" \
-e CFG_DIR="path/to/config.yml" \
-v "/path/to/yourfolder:/movie_dir" \
rabbired/bt-tools
```

### or

```
docker run --rm -v "/path/to/yourfolder:/movie_dir" rabbired/bt-tools subfinder --help
docker run --rm -v "/path/to/yourfolder:/movie_dir" rabbired/bt-tools autoremove-torrents --help
docker run --rm -v "/path/to/yourfolder:/movie_dir" rabbired/bt-tools flexget --help
```
