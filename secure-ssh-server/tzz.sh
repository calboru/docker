export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true

DPKG_RECONFIGURE_PRESEED=$(mktemp --tmpdir dpkg_reconfigure_preseed.XXX)

cat >"${DPKG_RECONFIGURE_PRESEED}" << EOM
tzdata tzdata/Areas select Europe
tzdata tzdata/Zones/Europe select Berlin
EOM

debconf-set-selections "${DPKG_RECONFIGURE_PRESEED}"

rm -f /etc/{localtime,timezone}
dpkg-reconfigure --frontend=noninteractive tzdata 2>/dev/null
rm -f  "${DPKG_RECONFIGURE_PRESEED}"