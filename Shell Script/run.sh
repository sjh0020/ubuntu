echo 将设置su密码，请在下面键入密码：
sudo passwd
echo 正在更新软件包信息...
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*
sudo apt-get update
echo 正在卸载不必要的软件...
sudo apt-get remove --purge \
	libreoffice* \
	thunderbird* \
	snapd* \
	cheese \
	shotwell \
	transmission-gtk \
	rhythmbox \
	remmina \
	simple-scan \
	evince \
	usb-creator-gtk \
	totem \
	aisleriot \
	gnome-mahjongg \
	gnome-sudoku \
	update-manager \
	gnome-mines -y
echo 将删除livepatch在抽屉的快捷方式...
sudo rm -rf /usr/share/applications/software-properties-livepatch.desktop
echo 正在清理不再依赖的软件包...
sudo apt-get --purge autoremove -y
sudo apt-get autoclean
sudo apt-get -f install
echo 正在更新软件...
sudo apt-get upgrade -y
sudo apt-get disk-upgrade -y
echo 正在安装语言支持...
sudo apt-get install hunspell-en-ca \
	hunspell-en-au \
	hunspell-en-za \
	hunspell-en-gb -y
echo 即将安装synaptic、grub-customizer、gnome-tweaks、curl...
sudo apt-get install \
	synaptic \
	grub-customizer \
	gnome-tweaks \
	curl \
	vim -y
echo 将下载Lantern、LibreOffice7.2_x86-64...
echo 正在下载蓝灯加速器...
wget -c  -P doc/temp https://s3.amazonaws.com/lantern/lantern-installer-64-bit.deb
echo 正在下载LibreOffice7.2_x86-64主包...
wget -c -P doc/temp https://mirrors.cloud.tencent.com/libreoffice/libreoffice/stable/7.2.0/deb/x86_64/LibreOffice_7.2.0_Linux_x86-64_deb.tar.gz
echo 正在下载LibreOffice7.2_x86-64_langpack...
wget -c -P doc/temp https://mirrors.cloud.tencent.com/libreoffice/libreoffice/stable/7.2.0/deb/x86_64/LibreOffice_7.2.0_Linux_x86-64_deb_langpack_zh-CN.tar.gz
echo 正在下载LibreOffice7.2_x86-64_helppack...
wget -c -P doc/temp https://mirrors.cloud.tencent.com/libreoffice/libreoffice/stable/7.2.0/deb/x86_64/LibreOffice_7.2.0_Linux_x86-64_deb_helppack_zh-CN.tar.gz
echo 正在解压所有tar.gz...
tar -zxvf doc/temp/LibreOffice_7.2.0_Linux_x86-64_deb.tar.gz  -C doc/temp
tar -zxvf doc/temp/LibreOffice_7.2.0_Linux_x86-64_deb_langpack_zh-CN.tar.gz  -C doc/temp
tar -zxvf doc/temp/LibreOffice_7.2.0_Linux_x86-64_deb_helppack_zh-CN.tar.gz  -C doc/temp
echo 正在安装LibreOffice7.2_x86-64...
sudo dpkg -i doc/temp/LibreOffice_7.2.0.*_Linux_x86-64_deb/DEBS/*.deb
echo 正在安装LibreOffice7.2_x86-64_langpack...
sudo dpkg -i doc/temp/LibreOffice_7.2.0.*_Linux_x86-64_deb_langpack_zh-CN/DEBS/*.deb
echo 正在安装LibreOffice7.2_x86-64_helppack...
sudo dpkg -i doc/temp/LibreOffice_7.2.0.*_Linux_x86-64_deb_helppack_zh-CN/DEBS/*.deb
echo 正在安装Lantern-64-bit...
sudo dpkg -i doc/temp/lantern-installer-64-bit.deb
cp doc/lantern.desktop ~/桌面
echo 正在清理下载文件...
sudo rm -rf doc/temp/*
echo 正在使用自动安装脚本安装Docker...
curl -sSL https://get.docker.com/ | sh
echo 正在将此账户添加到docker用户组
sudo groupadd docker
sudo gpasswd -a ${USER} docker
echo 添加“/“的快捷方式到桌面
ln -s "/" ~/桌面/此电脑
echo 更改桌面图标配置文件
sudo rm /usr/share/gnome-shell/extensions/desktop-icons@csoriano/prefs.js
sudo cp doc/prefs.js /usr/share/gnome-shell/extensions/desktop-icons@csoriano
echo "即将重启 /a"
reboot
