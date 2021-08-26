# 关于Ubuntu20.04.2提示无法提供完整语言支持解决办法

确定下载文件后提示依赖关系不正确
看了很多教程都没什么用，作为Ubuntu的小白，尝试打开终端按照在提示下载页中展开详细，逐个apt安装，发现是前缀为libreoffice的软件的报错，而且用sudo apt-get -f install liberoffice提示无法修正，原因是apt中的libreoffice为6.4.7，版本过于古老，目前最新版本为7.2


## 解决方法：

### 安装libreoffice

找对方向后在[Libreoffice官方国内镜像下载](https://mirrors.cloud.tencent.com/libreoffice/libreoffice/stable/)下载对应想安装的版本，这里我选择了[7.2.0/deb/x86_64](https://mirrors.cloud.tencent.com/libreoffice/libreoffice/stable/7.2.0/deb/x86_64/)，下载3个文件：[LibreOffice_7.2.0_Linux_x86-64_deb.tar.gz](https://mirrors.cloud.tencent.com/libreoffice/libreoffice/stable/7.2.0/deb/x86_64/LibreOffice_7.2.0_Linux_x86-64_deb.tar.gz),[LibreOffice_7.2.0_Linux_x86-64_deb_helppack_zh-CN.tar.gz](https://mirrors.cloud.tencent.com/libreoffice/libreoffice/stable/7.2.0/deb/x86_64/LibreOffice_7.2.0_Linux_x86-64_deb_helppack_zh-CN.tar.gz),[LibreOffice_7.2.0_Linux_x86-64_deb_langpack_zh-CN.tar.gz](https://mirrors.cloud.tencent.com/libreoffice/libreoffice/stable/7.2.0/deb/x86_64/LibreOffice_7.2.0_Linux_x86-64_deb_langpack_zh-CN.tar.gz)
然后解压

或者在终端输入代码：

> wget -c https://mirrors.cloud.tencent.com/libreoffice/libreoffice/stable/7.2.0/deb/x86_64/LibreOffice_7.2.0_Linux_x86-64_deb.tar.gz
> wget -c https://mirrors.cloud.tencent.com/libreoffice/libreoffice/stable/7.2.0/deb/x86_64/LibreOffice_7.2.0_Linux_x86-64_deb_helppack_zh-CN.tar.gz
> wget -c https://mirrors.cloud.tencent.com/libreoffice/libreoffice/stable/7.2.0/deb/x86_64/LibreOffice_7.2.0_Linux_x86-64_deb_langpack_zh-CN.tar.gz
>
> tar -xvf  LibreOffice_7.2.0_Linux_x86-64_deb.tar.gz  #解压指令具体没使用，作为小白还是用归档管理器友好
> tar -xvf LibreOffice_7.2.0_Linux_x86-64_deb_helppack_zh-CN.tar.gz
> tar -xvf LibreOffice_7.2.0_Linux_x86-64_deb_langpack_zh-CN.tar.gz 

鉴于前文原因，我直接双击进解压后目录进入DEBS文件夹内打开终端
> sudo dpkg -i ./*.deb

安装对应文件顺序应先安装libreoffice主体，然后再安装helppack和langpack对应中文离线帮助文档和语言包

### 卸载libreoffice6.4.7

懂正则的可以用命令卸载旧版，可以试试用sudo apt-get remover --purge libreoffice6.4.7-* 。这里我用synaptic图形界面卸载，搜索libreoffice，在搜索结果中逐个把版本为6.4.7的软件全部右键标记彻底删除，最后点击应用，这时就会自动应用更改，可能还会有卸载残余，继续标记彻底删除应用即可
可以退出synaptic在终端使用apt-get autoremove移除不再需要的软件包。

### 安装语言文件

但是这时只是排除了由于libreoffice版本老的报错，语言支持还不完整，再次打开语言支持，确认安装，如果说权限不足，那就用开头办法，退出再打开一次，查看详情在终端用sudo apt-get install逐个安装对应语言文件，然后再次打开就不会提示。

## 更好的解决方法

首先卸载原来的libreoffice

> sudo apt-get remove --purge libreoffice*

然后按照上面做法下载7.2版本安装，最后安装系统语言文件