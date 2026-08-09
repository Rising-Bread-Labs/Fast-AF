#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="fast-af"
iso_label="FASTAF_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="Fast-AF Linux <https://github.com/Rising-Bread-Labs/Fast-AF/tree/main>"
iso_application="Fast-AF UEFI Installer ISO"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="fastaf"
buildmodes=('iso')
bootmodes=('uefi.systemd-boot')
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'zstd' '-b' '1M')
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.gnupg"]="0:0:700"
  ["/usr/local/bin/fastaf-install-tui"]="0:0:755"
  ["/usr/local/bin/fastaf-install"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
)
