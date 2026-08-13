# fix for screen readers
if grep -Fqa 'accessibility=' /proc/cmdline &> /dev/null; then
    # Enable horizontal scrolling in GNU Readline for screen readers
    bind 'set horizontal-scroll-mode on'
fi

~/.automated_script.sh
