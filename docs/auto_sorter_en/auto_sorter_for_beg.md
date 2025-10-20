# For who the documentation intended?

This guide is intended for people who want to understand my script from scratch. The analysis will be very detailed using simple terms (key concepts will be explained **NOT** only in technical language).

==IMPORTANT!== If you want to read the documentation quickly and concisely, please go to the section for developers (keep in mind that terms and other definitions won't be explained in the same way as in this documentation. If you're unsure about your skills, read this documentation first).

# What does the script do?

The script serves to sort files with different extensions into their corresponding directories.

# Script logic

1. **Path Initialization** - Defines the source directory (`Source_dir`) and target directories for different file types

2. **Directory Creation** - Checks for the existence of target folders, creates them if absent

3. **File Processing Loop** - For each file in the source directory:

4. Determines the file extension
5. Performs classification by the following types:

    **Images** (.jpg, .jpeg, .png, .gif, .bmp)

    **Video** (.mp4, .avi, .mkv, .wmv, .flv)

    **Documents** (.pdf, .doc, .docx, .txt, .rtf, .xls, .xlsx, .ppt, .pptx)

    **Audio** (.mp3, .wav, .aac, .ogg)

    **Archives** (.zip, .rar, .tar)


==Files are moved to corresponding target directories==

1. **Completion** - Displays a message about successful sorting completion

# System compatibility

Script intended for next systems:

- **Linux**

- **MacOS**


It’s worth to say, code will differ between the systems only in paths. First, let’s start to analysis with Linux and second with MacOS

---

# Code for Linux systems:

```bash
#!/bin/bash
Source_dir="/home/username/Downloads" # SET YOUR NICKNAME INSTEAD OF `username`!!!

Result_picture="/home/username/picture"  # SET YOUR NICKNAME INSTEAD OF `username`!!!
Result_video="/home/username/video" # SET YOUR NICKNAME INSTEAD OF `username`!!!
Result_music="/home/username/music"  # SET YOUR NICKNAME INSTEAD OF `username`!!!
Result_documents="/home/username/documents"  # SET YOUR NICKNAME INSTEAD OF `username`!!!
Result_archives="/home/username/archives"  # SET YOUR NICKNAME INSTEAD OF `username`!!!

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
```

# Line-by-line analysis

---

# Shebang - what is it?

shebang is the definition of the interpreter for executing the script. Roughly speaking, we tell the system that the interpreter will read the Bash script.

```bash
#!/bin/bash
```

# Variables logic

We initialize the target variable `Source_dir` and declare it as the path to the `Downloads` directory.

```bash
Source_dir="/home/username/Downloads"
```

We'll take files from this variable and save them in the following directories:

1. The `picture` target directory for the `Result_picture` variable.

2. The `video` target directory for the `Result_video` variable.

3. The `music` target directory for the `Result_music` variable.

4. The `documents` target directory for the `Result_documents` variables.

5. The `archives` target directory for the `Result_archives` variables.


You might be wondering what happens if the user doesn't have these directories on their system. Will they have to create them themselves before using the script? The script, not the user, will create the target directories using the following command:

```bash
mkdir -p "$Result_picture" "$Result_video" "$Result_documents" "$Result_music" "$Result_archives"
```

The `mkdir` keyword in Bash (Bourne Again SHell) is a command that creates directories on the system. It's followed by the `-p` parameter, which creates the "missing" directory chain.

I'd also like to mention two commands (echo, sleep).

1) The echo command outputs a specific text to the terminal (in our case, it's "Creating directories").

2) The sleep command pauses (stops execution) for a specified (fixed) time, in our case, 1. After this time, the program resumes execution. This is simply to add some realism to the system's operation.

# Cycle and condition

```bash
for file in "$Source_dir"/*; do
if [ -f "$file" ]; then
filename=$(basename "$file")
```

Here we use a Cycle, in programming there are several types of them, for example, the while cycle, or as in our case for, they serve as duplication of certain actions, for example, in our case we force the for cycle to "iterate" through the files in the specified directory.

We'll create a `file` loop that will check all the contents (`*`) of the target `Downloads` directory. Keep in mind that the downloads directory may contain directories as well as files, but we only want files sorted into their assigned directories. We'll check:

```bash
if [ -f "$file" ]; then
filename=$(basename "$file")
```

This code fragment contains an 'if then' condition. Bash has several types of these, just like loops, but we'll only touch on this one. A condition in programming is a test of a condition that can either be true (in Bash, true is denoted by 0) or false (in Bash, false is denoted by 1).

We check with the `-f` parameter whether the iteration is a file, if so, then we create a `filename` variable, which stores the following:

```bash
$(basename "$file")
```

The `basename` keyword is a command that extracts a filename (including its extension). For example, if the loop finds the file `testfile.png` in the target `Downloads` directory, then `filename` will have the value `testfile.png` accordingly.

# case construction

`case` (or its equivalent in other programming languages, `switch case`) is a Bash construct that simplifies code reading, makes it more concise, and allows for multiple conditions to be contained within a single block. Simply put, `case` is the same as an `if then`-type condition, only more suitable for large numbers of conditions (as in our case, for example). It looks like this:

```bash
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
```

At the very top of the code, we set a certain condition: "If `filename` contains any of the file extensions listed below in its name, then redirect it to the corresponding target directory."

- It's worth noting that in Bash, the `*` symbol represents any name (for example, in our case - any filename).

- The `|` symbol means `OR`, meaning the condition allows us to check not just one extension, but multiple ones at once.

- The `;;` symbol indicates the end of one condition.

- The `*)` symbol is a keyword used to specify a default case for the `case` construct (typically used to handle errors, for instance, when none of the file extensions match those we specified in the conditions).


`esac` - the keyword used to indicate the end of the entire `case` conditional block.

`fi` - marks the end of the `if` condition (the one that was above the `case` statement).

`done` - indicates the end of the loop (located above the `if then` condition).

The final `echo` tells us that everything went well and the file sorting completed successfully.

---

# Code for MacOS systems

```bash
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
```
