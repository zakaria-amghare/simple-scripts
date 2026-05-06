#!/bin/bash

cd "/mnt/c/Users/zakar/Desktop/just me playing around"

tree -d
read -p "Press Enter to browse folders..."

choice=$(find . -type d | fzf \
--preview '
    echo "Size:    $(du -sh {} | cut -f1)"
    echo "Files:   $(find {} -type f | wc -l)"
    echo "Folders: $(find {} -type d | wc -l)"
    echo "---"
    ls -la {}
' \
--preview-window=right:50%
)

# exit if user pressed ESC
if [[ -z "$choice" ]]; then
    echo "Nothing selected"
    exit 0
fi

echo ""
echo "==============================="
echo "  $choice"
echo "==============================="
echo "Size:    $(du -sh "$choice" | cut -f1)"
echo "Files:   $(find "$choice" -type f | wc -l)"
echo "Folders: $(find "$choice" -type d | wc -l)"