#!/bin/bash

# Default IP
sed -i 's/192.168.1.1/192.168.123.2/g' package/base-files/files/bin/config_generate

# Firewall
echo "iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE" >> package/network/config/firewall/files/firewall.user

# Remove packages
#rm -rf feeds/packages/lang/golang

# Add packages
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git -b main package/passwall_package
git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall
git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworld
git clone https://github.com/sbwml/packages_lang_golang -b 20.x feeds/packages/lang/golang
git clone --depth=1 https://github.com/ophub/luci-app-amlogic package/amlogic
