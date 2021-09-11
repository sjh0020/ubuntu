这是个人为方便个人的重装Ubuntu后的配置脚本
## 如果要使用请在知悉脚本内容后执行
## run.sh

为卸载一些[系统自带软件](https://github.com/sjh0020/ubuntu#apt-get-remove)，并安装LibreOffice7.2.0，synaptic，vim，gnome-tweaks，grub-customizer，lantern/蓝灯加速器，docker
将会删除抽屉中livepatch的快捷方式，更改桌面应用图标大小，在桌面新建蓝灯的快捷方式，根目录的快捷方式并命名为"此电脑"
执行完成后自动重启一次

## dockerrun

以下两个脚本均会在桌面添加AriaNg的Firefox快捷方式，AriaNg.ico储存在~/图片中

### dockerrun.sh

为个人部署[aria2-pro](https://p3terx.com/archives/docker-aria2-pro.html)、[ariang](https://p3terx.com/archives/aria2-frontend-ariang-tutorial.html)、[watchtower](https://p3terx.com/archives/docker-watchtower.html)方案，未配置IPV6版

### dockerrunIPV6.sh

为配置了IPV6的方案，请确保网络完整支持IPV6，能加速BT下载，否则将可能下载错误

# 运行脚本

```bash
$ bash run.sh
$ bash dockerrun.sh
$ bash dockerrunIPV6.sh
```