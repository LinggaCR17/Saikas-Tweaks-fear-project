rm -rf /data/adb/modules/personalbuild; rm -rf /data/adb/modules_updates/personalbuild;

stealing="$MODPATH"
aint="personalbuild"
cool="$stealing/$aint"

mkdir -p $stealing/system
mv $stealing/systembuild/* $stealing/system
rm -rf $stealing/systembuild

ABI="$(getprop ro.product.cpu.abi)"

if [[ "$(magisk --sqlite "SELECT value FROM settings WHERE (key='zygisk')")" == "value=1" ]]; then
	ui_print "- Injected into Zygisk"
	if [ "$ABI" == "armeabi-v7a" ]; then
		  ABI32=armeabi-v7a
		  ui_print "- Using $ABI32"
		  mkdir -p $stealing/system/lib
		  mv $stealing/libs/$ABI32/*.so $stealing/system/lib
		  rm -rf $stealing/libs
		elif [ "$ABI" == "arm64" ]; then
		  ABI64=arm64-v8a
		  ui_print "- Using $ABI64"
		  mkdir -p $stealing/system/lib64
		  mv $stealing/libs/$ABI64/*.so $stealing/system/lib64
		  rm -rf $stealing/libs
		elif [ "$ABI" == "x86" ]; then
		  ABI86=x86
		  ui_print "- Doesn't supported $ABI86"
		
		  ui_print "- Using $ABI32"
		  mkdir -p $stealing/system/lib
		  mv $stealing/libs/$ABI32/*.so $stealing/system/lib
		  rm -rf $stealing/libs
		
		  ui_print "- Using $ABI64"
		  mkdir -p $stealing/system/lib64
		  mv $stealing/libs/$ABI64/*.so $stealing/system/lib64
		  rm -rf $stealing/libs
		elif [ "$ABI" == "x86_64" ]; then
		  ABI86_64=x86_64
		  ui_print "- Doesn't supported $ABI86_64"
		
		  ui_print "- Using $ABI32"
		  mkdir -p $stealing/system/lib
		  mv $stealing/libs/$ABI32/*.so $stealing/system/lib
		  rm -rf $stealing/libs
		
		  ui_print "- Using $ABI64"
		  mkdir -p $stealing/system/lib64
		  mv $stealing/libs/$ABI64/*.so $stealing/system/lib64
		  rm -rf $stealing/libs
		fi
	sed -i "/version=/c version=14-zygisk" /data/adb/modules_update/personalbuild/module.prop; else
	if [[ "$(magisk --sqlite "SELECT value FROM settings WHERE (key='zygisk')")" == "value=0" ]]; then
		ui_print "- Install as Normal module"
		if [ "$ABI" == "armeabi-v7a" ]; then
		  ABI32=armeabi-v7a
		  ui_print "- Using $ABI32"
		  mkdir -p $stealing/system/lib
		  mv $stealing/libs/$ABI32/*.so $stealing/system/lib
		  rm -rf $stealing/libs
		elif [ "$ABI" == "arm64" ]; then
		  ABI64=arm64-v8a
		  ui_print "- Using $ABI64"
		  mkdir -p $stealing/system/lib64
		  mv $stealing/libs/$ABI64/*.so $stealing/system/lib64
		  rm -rf $stealing/libs
		elif [ "$ABI" == "x86" ]; then
		  ABI86=x86
		  ui_print "- Doesn't supported $ABI86"
		
		  ui_print "- Using $ABI32"
		  mkdir -p $stealing/system/lib
		  mv $stealing/libs/$ABI32/*.so $stealing/system/lib
		  rm -rf $stealing/libs
		
		  ui_print "- Using $ABI64"
		  mkdir -p $stealing/system/lib64
		  mv $stealing/libs/$ABI64/*.so $stealing/system/lib64
		  rm -rf $stealing/libs
		elif [ "$ABI" == "x86_64" ]; then
		  ABI86_64=x86_64
		  ui_print "- Doesn't supported $ABI86_64"
		
		  ui_print "- Using $ABI32"
		  mkdir -p $stealing/system/lib
		  mv $stealing/libs/$ABI32/*.so $stealing/system/lib
		  rm -rf $stealing/libs
		
		  ui_print "- Using $ABI64"
		  mkdir -p $stealing/system/lib64
		  mv $stealing/libs/$ABI64/*.so $stealing/system/lib64
		  rm -rf $stealing/libs
		fi
	sed -i "/version=/c version=14-normal" /data/adb/modules_update/personalbuild/module.prop
	fi
fi

set_perm_recursive "$cool"		   root root 0777 0755
set_perm_recursive "$stealing"	   root root 0777 0755

set_perm_recursive "$stealing/scene" root root 0777 0755
ui_print ""
ui_print " Personalbuild, our big, little core"
ui_print " $(getprop ro.boot.boot_devices)"

mkdir -p $stealing/logs
ui_print "
	𝘈𝘵𝘵𝘦𝘯𝘵𝘪𝘰𝘯, 𝘳𝘦𝘮𝘦𝘮𝘣𝘦𝘳
		𝘯𝘰𝘵 𝘳𝘦𝘤𝘰𝘮𝘮𝘦𝘯𝘥𝘦𝘥 𝘧𝘰𝘳 𝘥𝘢𝘪𝘭𝘺 𝘶𝘴𝘦, 𝘢𝘤𝘵𝘪𝘷𝘢𝘵𝘦 𝘪𝘵 𝘸𝘩𝘦𝘯 𝘺𝘰𝘶 𝘯𝘦𝘦𝘥 𝘪𝘵.
		𝘜𝘴𝘦 𝘪𝘵 𝘸𝘩𝘦𝘯 𝘺𝘰𝘶 𝘯𝘦𝘦𝘥 𝘭𝘪𝘨𝘩𝘵 𝘳𝘦𝘯𝘥𝘦𝘳𝘪𝘯𝘨 𝘸𝘩𝘦𝘯 𝘱𝘭𝘢𝘺𝘪𝘯𝘨 𝘨𝘢𝘮𝘦𝘴.
		𝘸𝘪𝘭𝘭 𝘴𝘶𝘤𝘬 𝘶𝘱 𝘢𝘭𝘭 𝘵𝘩𝘦 𝘣𝘢𝘵𝘵𝘦𝘳𝘺 𝘱𝘦𝘳𝘧𝘰𝘳𝘮𝘢𝘯𝘤𝘦 𝘤𝘰𝘮𝘱𝘭𝘦𝘵𝘦𝘭𝘺.
"
sed -i "/description=/c description=Reboot required. personalbuild by changing your perf options Big, Little Core." /data/adb/modules_update/personalbuild/module.prop;

bin=xbin

if [ ! -d system/xbin ]; then
	bin=bin
	mkdir $stealing/system/$bin
	mv $stealing/system/xbin/* $stealing/system/$bin
	rm -rf $stealing/system/xbin/*
	rmdir $stealing/system/xbin
fi

function FindThermal()
{
	for systemThermal in `ls $1 | grep $2`
	do
		if [[ "$systemThermal" == *"-BlankFile"* ]]; then
			ui_print " → $1/$systemThermal"
		elif [[ "$systemThermal" == *"-OriFile.bck"* ]]; then
			ui_print " → $1/$systemThermal"
			ui_print ""
		else
			ui_print " → $1/$systemThermal"
			system=system/vendor
			mkdir -p $stealing/$system/bin; mkdir -p $stealing/$system/etc
			if [ $2 == "thermal" ]; then
				if [ ! -f "$3/$systemThermal-BlankFile" ]; then
					echo "" > "$3/$systemThermal-BlankFile"
				fi
				if [ ! -f "$3/$systemThermal-OriFile.bck" ]; then
					cp -af "$1/$systemThermal" "$3/$systemThermal-OriFile.bck"
				fi
				cp -af "$3/$systemThermal-BlankFile" "$3/$systemThermal"
			else
				if [ ! -f "$3/$systemThermal" ]; then
					cp -af "$1/$systemThermal" "$3/$systemThermal"
				fi
			fi
		fi
	done
}

FindThermal "/system/bin" '"*-OriFile.bck"' "$stealing/system/bin"
FindThermal "/system/bin" 'thermal' "$stealing/system/bin"
FindThermal "/vendor/bin" '"*-OriFile.bck"' "$stealing/system/vendor/bin"
FindThermal "/vendor/bin" 'thermal' "$stealing/system/vendor/bin"
FindThermal "/vendor/etc" '"*-OriFile.bck"' "$stealing/system/vendor/etc"
FindThermal "/vendor/etc" 'thermal' "$stealing/system/vendor/etc"

echo "0" > "$stealing/system/vendor/etc/thermalStatus.info"

set_perm_recursive $stealing				   0 0 0755 0777
set_perm_recursive $stealing/system/$bin	   0 0 0755 0777

if [ $bin == "xbin" ]; then
	set_perm_recursive $stealing/system/bin	0 0 0755 0777
fi

set_perm_recursive $stealing/system/vendor/bin 0 0 0755 0777
set_perm_recursive $stealing/system/vendor/etc 0 0 0755 0644
set_perm_recursive $stealing/system/etc/zybrog 0 0 0755 0777

echo "$NVBASE/modules" > /data/zybrog
