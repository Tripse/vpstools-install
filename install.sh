#!/bin/bash
# leadlife vostools install script
# tools - package install:[nmap、masscan、sqlmap]
# tools - git install：
# 漏扫：afrog，nuclei，nuclei-templates
# 信息搜集：amass，subfinder，rapiddns，asnmap，puredns
# 字典：seclists
# 辅助：scan4all，anew，httpx，uncover、resolvers-trusted.txt(https://github.com/trickest/resolvers/blob/main/resolvers-trusted.txt)
# 端口：jfscan，naabu
# 指纹：observer，ehole，dismap，cmseek
# 枚举：ffuf



# 获取 Linux 发行版名称
echo "正在安装可通过包管理器直接安装的程序..."
distro=$(grep '^ID=' /etc/os-release | cut -d'=' -f2 | tr -d '"')

echo "检测到 Linux 发行版为：$distro"

case $distro in
    ubuntu|debian)
        apt update -y
        apt install nmap -y
        ;;
        
    centos|fedora|rhel)
        yum install -y nmap
        ;;

    arch|endeavouros)    
        pacman -Sy nmap
        ;;

    *)
        echo "不支持的 Linux 发行版,请检查!"
        exit 1
        ;;
esac

echo "nmap 安装完毕!"
