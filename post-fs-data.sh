MODDIR=${0%/*}
TARGET_PATH=""
CHECK="/product/etc
/vendor/etc"
for path in $CHECK; do
  if [[ -d $path/device_features ]]; then
    TARGET_PATH="$path/device_features"
    break
  fi
done
CHANGE=$MODDIR/system/$TARGET_PATH
mkdir -p $CHANGE
rm $CHANGE/*
if [ ! -f $MODDIR/../mff.marker ]; then
    cp -f $TARGET_PATH/* $CHANGE/
    sed -i 's/"is_only_support_keycode_goto">true</"is_only_support_keycode_goto">false</g' $CHANGE/*.xml
else
    sed -i 's/"is_only_support_keycode_goto">true</"is_only_support_keycode_goto">false</g' $MODDIR/../MIUI_Flash_Freely/system/$TARGET_PATH/*.xml
    cp -f $MODDIR/../MIUI_Flash_Freely/system/$TARGET_PATH/* $CHANGE/
fi
touch $MODDIR/../maodf.marker
