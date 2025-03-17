SKIPUNZIP=1

unzip -o "$ZIPFILE" "module.prop" -d "$MODPATH"
unzip -o "$ZIPFILE" "system/*"    -d "$MODPATH"
ln -s "/system_ext/lib64/libstnfc_nci_jni.so" "$MODPATH/system/system_ext/app/Nfc_st/lib/arm64/"

if [[ -z "$(pm list packages | grep com.mipay.wallet)" ]]; then
  ui_print "Wallet not installed, installing"
  unzip -o "$ZIPFILE" "wallet.apk" -d "$TMPDIR"
  pm install "$TMPDIR/wallet.apk"
else
  ui_print "Wallet already installed, skip install"
fi
