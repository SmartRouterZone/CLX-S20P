
## Add S20P

- [mtk-openwrt-feeds](https://github.com/mediatek/mtk-openwrt-feeds)  
[OpenWRT-24.10](https://github.com/openwrt/openwrt/tree/openwrt-24.10)  
[immortalwrt-24.10](https://github.com/immortalwrt/immortalwrt/tree/openwrt-24.10)
- Merge MTK-Feeds `20260725`
- 支持MTK闭源WiFi驱动 (*7.6.7.1* - *7.6.7.3*)
- 支持hnat驱动、内核补丁及配置工具，支持所有硬件加速特性
- 2.5G口工作正常


  ### Quickstart
  1. Run `./scripts/feeds update -a` to obtain all the latest package definitions defined in feeds.conf / feeds.conf.default
  2. Run `./scripts/feeds install -a` to install symlinks for all obtained packages into package/feeds/
  3. Copy the configuration file for your device from the `defconfig` directory to the project root directory and rename it `.config`
     
     ```bash
     # MT7981
     cp -f defconfig/mt7981-ax3000.config .config

     # MT7986
     cp -f defconfig/mt7986-ax6000.config .config
     or
     cp -f defconfig/mt7975-ipailna-high-power.config .config
     ```
  4. Run `make` to build your firmware. This will download all sources, build the cross-compile toolchain and then cross-compile the GNU/Linux kernel & all chosen applications for your target system.