# openwrt_docker
突发奇想用 Docker 配置下 OpenWrt 的编译环境
> 本项目仅为 docker 练手，如出意外请谨慎使用
- 以 [lede](https://github.com/coolsnowwolf/lede) 的源码为基础，整合了 [kenzok9](https://github.com/kenzok8/openwrt-packages) 搜集的插件 \
- 由于 [ikoolproxy](https://github.com/yaof-project/luci-app-ikoolproxy) 没有成功添加，删掉了其内容

由于编译出的 docker 镜像体积太过庞大，经 docker-slim 几次瘦身失败，故仅放出 Dockerfile，待后续缩减体积成功后再上传至 Docker Hub

## 使用方法
### 编译
```
docker build -f Dockerfile -t <自定义镜像名称> .
```
### 运行
```
docker run -it <自定义镜像名称>
```
成功进入后按照正常方法编译即可