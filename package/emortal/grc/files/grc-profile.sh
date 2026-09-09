[ "$(id -u 2>/dev/null)" = 0 ] || return 0

GRC_ROOT_SHELL=$(awk -F: '$1 == "root" { print $7; exit }' /etc/passwd)
case "${GRC_ROOT_SHELL##*/}" in
	ash|bash)
		. /usr/share/grc/grc.sh
		;;
	zsh)
		. /usr/share/grc/grc.zsh
		;;
esac
unset GRC_ROOT_SHELL
