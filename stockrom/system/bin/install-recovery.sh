#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 11905024 4428fefefd12294e9c800ec0eb6cc3d306813838 9138176 4fc07792bfd516a15817e99a044cebb0b608a184
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:11905024:4428fefefd12294e9c800ec0eb6cc3d306813838; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:9138176:4fc07792bfd516a15817e99a044cebb0b608a184 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 4428fefefd12294e9c800ec0eb6cc3d306813838 11905024 4fc07792bfd516a15817e99a044cebb0b608a184:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
