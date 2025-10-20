#!/bin/bash  
Source_dir="/Users/username/Downloads" # ПОСТАВЬ СВОЁ ИМЯ ПОЛЬЗОВАТЕЛЯ!!!

Result_picture="/Users/username/picture"  # ПОСТАВЬ СВОЁ ИМЯ ПОЛЬЗОВАТЕЛЯ!!!
Result_video="/Users/username/video"  # ПОСТАВЬ СВОЁ ИМЯ ПОЛЬЗОВАТЕЛЯ!!!
Result_music="/Users/username/music"  # ПОСТАВЬ СВОЁ ИМЯ ПОЛЬЗОВАТЕЛЯ!!!
Result_documents="/Users/username/documents"  # ПОСТАВЬ СВОЁ ИМЯ ПОЛЬЗОВАТЕЛЯ!!!
Result_archives="/Users/username/archives"  # ПОСТАВЬ СВОЁ ИМЯ ПОЛЬЗОВАТЕЛЯ!!!

echo "Creating directories"  
mkdir -p "$Result_picture" "$Result_video" "$Result_documents" "$Result_music" "$Result_archives"
sleep 1  

for file in "$Source_dir"/*; do
if [ -f "$file" ]; then  
filename=$(basename "$file")  

case "$filename" in
*.jpg|*.jpeg|*.png|*.gif|*.bmp)  
echo "Moving $filename to picture directory"  
mv "$file" "$Result_picture"  
;;  
*.mp4|*.avi|*.mkv|*.wmv|*.flv)  
echo "Moving $filename to video directory"  
mv "$file" "$Result_video"  
;;  
*.pdf|*.doc|*.docx|*.txt|*.rtf|*.xls|*.xlsx|*.ppt|*.pptx)  
echo "Moving $filename to document directory"  
mv "$file" "$Result_documents"  
;;  
*.mp3|*.wav|*.aac|*.ogg)  
echo "Moving $filename to music directory"  
mv "$file" "$Result_music"  
;;  
*.zip|*.rar|*.tar)  
echo "Moving $filename to archive directory"  
mv "$file" "$Result_archives"  
;;  
*)  
echo "Something went wrong..."  
esac  
fi  
done  
echo "File sorting was successfully completed."
