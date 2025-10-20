Target Audience
This API documentation is intended for developers who want to understand the script's structure and logic for potential modification or integration. The description will be technical but with explanations of key concepts.

==IMPORTANT!== If you need a beginner-friendly explanation, go to beginner doc.

Script Purpose
The script serves to sort files of different extensions into their corresponding directories.

Script Logic
Path Initialization - Defines source directory (Source_dir) and target directories for different file types

Directory Creation - Checks for existence of target folders, creates them if absent

File Processing Loop - For each file in the source directory:

Determines file extension

Classification by type:
Images (.jpg, .jpeg, .png, .gif, .bmp)
Video (.mp4, .avi, .mkv, .wmv, .flv)
Documents (.pdf, .doc, .docx, .txt, .rtf, .xls, .xlsx, .ppt, .pptx)
Audio (.mp3, .wav, .aac, .ogg)
Archives (.zip, .rar, .tar)
==Files are moved to corresponding target directories==

Completion - Displays success message upon sorting completion

System Compatibility
**Script is designed for:

Linux

MacOS
Note that code differences between these two OSes are primarily in paths. We'll first analyze the Linux version, then MacOS.

Code for Linux Systems:
bash
#!/bin/bash
Source_dir="/home/username/Downloads" # REPLACE `username` WITH YOUR ACTUAL USERNAME!!!
Result_picture="/home/username/picture"  # REPLACE `username` WITH YOUR ACTUAL USERNAME!!!
Result_video="/home/username/video" # REPLACE `username` WITH YOUR ACTUAL USERNAME!!!
Result_music="/home/username/music" # REPLACE `username` WITH YOUR ACTUAL USERNAME!!!
Result_documents="/home/username/documents" # REPLACE `username` WITH YOUR ACTUAL USERNAME!!!
Result_archives="/home/username/archives" # REPLACE `username` WITH YOUR ACTUAL USERNAME!!!

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
API Architecture (Line-by-Line Analysis)
Variable Logic
Initialize the target variable Source_dir and define it as the path to the Downloads directory.

bash
Source_dir="/home/username/Downloads"
This variable serves as the source from which files will be extracted and distributed to the following directories:

Target directory picture - destination for images

Target directory video - destination for videos

Target directory music - destination for audio

Target directory documents - destination for documents

Target directory archives - destination for archives

mkdir -p Command
bash
mkdir -p "$Result_picture" "$Result_video" "$Result_documents" "$Result_music" "$Result_archives"
Purpose: Recursive creation of directories according to corresponding variables
Flag: -p - creates directory chain

Loop and Condition
Loop: for file in "$Source_dir"/*
bash
for file in "$Source_dir"/*; do
Purpose: iterate through elements in source directory

Condition: if [ -f "$file" ]
bash
if [ -f "$file" ]; then
Type: element type check
Flag: -f - file existence check
Return: boolean (0 - file exists, 1 - not a file)

If $file == 0, execute the following:

bash
filename=$(basename "$file")
basename function:
Purpose: extract filename with extension
Input: full file path
Output: filename with extension

Case Construct
Type: multi-conditional operator
Purpose: route files by extensions

bash
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
Classification:
Images (.jpg, .jpeg, .png, .gif, .bmp)

Video (.mp4, .avi, .mkv, .wmv, .flv)

Documents (.pdf, .doc, .docx, .txt, .rtf, .xls, .xlsx, .ppt, .pptx)

Audio (.mp3, .wav, .aac, .ogg)

Archives (.zip, .rar, .tar)

Code for MacOS Systems:
bash
#!/bin/bash
Source_dir="/Users/username/Downloads" # REPLACE WITH YOUR ACTUAL USERNAME!!!

Result_picture="/Users/username/picture"  # REPLACE WITH YOUR ACTUAL USERNAME!!!
Result_video="/Users/username/video"  # REPLACE WITH YOUR ACTUAL USERNAME!!!
Result_music="/Users/username/music"  # REPLACE WITH YOUR ACTUAL USERNAME!!!
Result_documents="/Users/username/documents"  # REPLACE WITH YOUR ACTUAL USERNAME!!!
Result_archives="/Users/username/archives"  # REPLACE WITH YOUR ACTUAL USERNAME!!!

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
