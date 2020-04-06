langInputChoice="输入你要选择的功能："
langChooseOpt1="(1) 更新缓存"
langChooseOpt2="(2) 挂载EFI分区并打开"
langChooseOpt3="(3) 编译kext到桌面"
langChooseOpt4="(4) 开启HIDPI"
langChooseOpt5="(5) 睡眠唤醒日志查看"
langChooseOpt="(0) 任意键退出"

function uploadEFI(){
	sudo mkdir /Volumes/EFI
##	sudo diskutil mount /dev/disk0s1 
	sudo mount -t msdos /dev/disk0s1 /Volumes/EFI
	open /Volumes/EFI/
}

function updateCache(){
	sudo spctl --master-disable
	sudo mount -uw /
	sudo killall Finder
	echo "正在重建缓存并修复权限"
	sudo chown -v -R root:wheel /System/Library/Extensions >/dev/null
	sudo touch /Library/Extensions	>/dev/null
	sudo kextcache -i /
}

function start(){

	echo ""
	echo "不知道功能请退出"
	echo ""
	echo ${langChooseOpt}
	echo ""
	echo ${langChooseOpt1}
	echo ${langChooseOpt2}
	echo ${langChooseOpt3}
	echo ${langChooseOpt4}
	echo ${langChooseOpt5}
	echo ""

	read -p "${langInputChoice}[1~5]: " input 
	case ${input} in
		1) updateCache
		;;
		2) uploadEFI
		;;
		3) ./compileKext.sh
		;;
		4) ./hidpi/hidpi.sh
		;;
		5) log show --last 1d | grep "Wake reason"
		;;
		*)
		echo "退出"
		exit 0
		;;
	esac	
}

start

