#!/bin/bash
# strip_non_english_letters.sh
# Keep only English letters (A–Z, a–z) in the filename, preserve extension

for file in *.*; do
  [ -f "$file" ] || continue

  name="${file%.*}"
  ext="${file##*.}"

  # Keep only letters
  clean_name=$(echo "$name" | sed 's/[^A-Za-z]//g')

  if [ "$clean_name" != "$name" ]; then
    new_file="${clean_name}.${ext}"
    echo "Renaming: $file → $new_file"
    mv -n -- "$file" "$new_file"
  fi
done

