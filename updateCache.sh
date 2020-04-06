sudo spctl --master-disable
sudo mount -uw /
sudo killall Finder
echo "正在重建缓存并修复权限"
sudo chown -v -R root:wheel /System/Library/Extensions >/dev/null
sudo touch /Library/Extensions	>/dev/null
sudo kextcache -i /