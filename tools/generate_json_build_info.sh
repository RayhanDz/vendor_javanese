#!/bin/sh
if [ "$1" ]
then
  file_path=$1
  file_name=$(basename "$file_path")
  out=$(dirname "$file_path")
  if [ -f $file_path ]; then
    file_size=$(stat -c%s $file_path)
    md5=$(cat "$file_path.md5sum" | cut -d' ' -f1)
    datetime=$(grep ro\.build\.date\.utc $out/system/build.prop | cut -d= -f2);
    id=$(sha256sum $file_path | awk '{ print $1 }');
    maintainer=$(grep org\.javanese\.maintainer $out/system/build.prop | cut -d= -f2)
    version=$(grep -m1 org\.javanese\.version $out/system/build.prop | cut -d= -f2);
    echo "{" > $file_path.json
    echo "  \"error\"       : false," >> $file_path.json
    echo "  \"id\"          : \"$id\"," >> $file_path.json
    echo "  \"filename\"    : \"$file_name\"," >> $file_path.json
    echo "  \"datetime\"    : $datetime," >> $file_path.json
    echo "  \"version\"     : \"$version\"," >> $file_path.json
    echo "  \"size\"        : $file_size," >> $file_path.json
    echo "  \"filehash\"    : \"$md5\"," >> $file_path.json
    echo "  \"url\"         : \"\"," >> $file_path.json
    echo "  \"news_url\"    : \"https://t.me/JavaneseOSupdates\"," >> $file_path.json
    echo "  \"maintainer\"  : \"$maintainer\"," >> $file_path.json
    echo "  \"maintainer_url\" : \"https://github.com/\"," >> $file_path.json
    echo "  \"forum_url\"      : \"https://t.me/JavaneseCommunityOfficial\"" >> $file_path.json
    echo "}" >> $file_path.json
  fi
fi
