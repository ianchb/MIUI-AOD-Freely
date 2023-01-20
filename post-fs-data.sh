MODDIR=${0%/*}
TARGET_PATH=""
SUPPORT="0"
CHECK="/product/etc
/vendor/etc"
for path in $CHECK; do
  if [[ -d $path/device_features ]]; then
    TARGET_PATH="$path/device_features"
    sed -i 's/description=View https://github.com/ianchb/MIUI-AOD-Freely for more./description=[🥰]Working. View https://github.com/ianchb/MIUI-AOD-Freely for more. /g' $MODDIR/module.prop
    SUPPORT="1"
    break
  fi
done
  if [[ $SUPPORT == "0" ]]; then
    sed -i 's/description=View https://github.com/ianchb/MIUI-AOD-Freely for more./description=[🤨]Your device is unsupported. View https://github.com/ianchb/MIUI-AOD-Freely for more. /g' $MODDIR/module.prop
    exit
  fi
CHANGE=$MODDIR/system/$TARGET_PATH
mkdir -p $CHANGE
rm $CHANGE/*
cp -f $TARGET_PATH/* $CHANGE/
sed -i 's/"is_only_support_keycode_goto">true</"is_only_support_keycode_goto">false</g' $CHANGE/*.xml
