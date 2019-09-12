# flexget
# subfinder / 字幕查找器
https://github.com/ausaki/subfinder
# Auto Remove Torrents / 自动删种程序
https://github.com/jerrymakesjelly/autoremove-torrents

### Run docker command / 运行docker指令

```
docker run -d \
-v "/path/to/your_config_folder:/config" \
-v "/path/to/your_movies_folder:/movies" \
-v "/path/to/your_torrent_folder:/torrents" \
rabbired/bt-tools
```

### or

```
docker run --rm -v "/path/to/yourfolder:/config" rabbired/bt-tools subfinder --help
docker run --rm -v "/path/to/yourfolder:/config" rabbired/bt-tools autoremove-torrents --help
docker run --rm -v "/path/to/yourfolder:/config" rabbired/bt-tools flexget --help
```
