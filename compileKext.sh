if [ -d ~/Desktop/Kext ]; then
	rm -rf ~/Desktop/Kext/
fi


mkdir ~/Desktop/Kext
mkdir ~/Desktop/Kext/releases

cd ~/Desktop/Kext

echo "克隆Lilu仓库"
git clone https://github.com/acidanthera/Lilu.git >/dev/null || exit 1
cd Lilu
echo “编译debug版本”
xcodebuild -target Lilu SYMROOT="build" -configuration Debug >/dev/null
cp -rf build/Debug/Lilu.kext ../releases

cd ../

echo "编译WateverGreen"
git clone https://github.com/acidanthera/WhateverGreen.git >/dev/null || exit 1
cp -rf Lilu/build/Debug/Lilu.kext WhateverGreen/
cd WhateverGreen
echo "开始编译"
xcodebuild -target WhateverGreen SYMROOT="build" -configuration Debug >/dev/null
cp -rf build/Debug/WhateverGreen.kext ../releases


cd ../

echo "编译AppleALC"
git clone https://github.com/acidanthera/AppleALC.git >/dev/null || exit 1
cp -rf Lilu/build/Debug/Lilu.kext AppleALC/
cd AppleALC
echo "开始编译"
xcodebuild -target AppleALC SYMROOT="build" -configuration Debug >/dev/null
cp -rf build/Debug/AppleALC.kext ../releases

cd ../
echo "编译CPUFriend"
git clone https://github.com/acidanthera/CPUFriend.git >/dev/null || exit 1
cp -rf Lilu/build/Debug/Lilu.kext CPUFriend/
cd CPUFriend
echo "开始编译"
xcodebuild -target CPUFriend SYMROOT="build" -configuration Debug >/dev/null
cp -rf build/Debug/CPUFriend.kext ../releases

cd ../
echo "VoodooInput"
echo "克隆仓库"
git clone https://github.com/acidanthera/VoodooInput.git >/dev/null || exit 1
cp -rf Lilu/build/Debug/Lilu.kext VoodooInput/
cd VoodooInput
echo "开始编译"
xcodebuild -target VoodooInput SYMROOT="build" -configuration Debug >/dev/null
cp -rf build/Debug/VoodooInput.kext ../releases

cd ../
echo "VoodooPS2"
echo "克隆仓库"
git clone https://github.com/acidanthera/VoodooPS2.git >/dev/null || exit 1
cp -rf Lilu/build/Debug/Lilu.kext VoodooPS2/
cd VoodooPS2
echo "更新子模块"
git submodule sync --recursive 
git submodule update --init --recursive
echo "开始编译"
xcodebuild -target VoodooPS2Controller SYMROOT="build" -configuration Debug >/dev/null || exit 1
cp -rf build/Debug/VoodooPS2Controller.kext ../releases


cd ../
echo "编译NVMeFix"
echo "克隆仓库"
git clone https://github.com/acidanthera/NVMeFix.git >/dev/null || exit 1
cp -rf Lilu/build/Debug/Lilu.kext NVMeFix/
cd NVMeFix
echo "开始编译"
xcodebuild -target NVMeFix SYMROOT="build" -configuration Debug >/dev/null
cp -rf build/Debug/NVMeFix.kext ../releases

cd ../
echo "编译"
echo "克隆仓库"
git clone https://github.com/acidanthera/VirtualSMC.git >/dev/null || exit 1
cp -rf Lilu/build/Debug/Lilu.kext VirtualSMC/
cd VirtualSMC
echo "开始编译"
xcodebuild -target VirtualSMC SYMROOT="build" -configuration Debug >/dev/null
xcodebuild -target SMCBatteryManager SYMROOT="build" -configuration Debug >/dev/null
xcodebuild -target SMCLightSensor SYMROOT="build" -configuration Debug >/dev/null
xcodebuild -target SMCProcessor SYMROOT="build" -configuration Debug >/dev/null
xcodebuild -target SMCSuperIO SYMROOT="build" -configuration Debug >/dev/null
cp -rf build/Debug/*.kext ../releases




