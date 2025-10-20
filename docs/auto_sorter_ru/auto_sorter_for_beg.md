# Для кого предназначена документация?

Данное руководство предназначена для тех людей, которые хотят разобраться с нуля в моем скрипте. Разбор будет очень детальным, простым (термины и др. ключевые слова будут объяснены НЕ только техническим языком).

==ВАЖНО!== Если вы хотите кратко и быстро прочитать документацию перейдите в раздел документации для разработчиков ( (имейте в виду, термины и другие определения не будут объясняться так же, как и в этой документации. Если вы не уверены в своих силах и навыках, то сперва прочитайте эту документацию).

# Что делает скрипт?
Скрипт служит сортированием файлов разных расширений в соответствующие им директории.

# Логика скрипта

1. Инициализация путей - Определяются исходная директория (Source_dir) и целевые директории для разных типов файлов

2. Создание директорий - Проверяется существование целевых папок, при отсутствии - создаются

3. Цикл обработки файлов - Для каждого файла в исходной директории:- Определяется расширение файла

4. Выполняется классификация по следующим типам:
   Изображения (.jpg, .jpeg, .png, .gif, .bmp)
   Видео (.mp4, .avi, .mkv, .wmv, .flv)
   Документы (.pdf, .doc, .docx, .txt, .rtf, .xls, .xlsx, .ppt, .pptx)

   Аудио (.mp3, .wav, .aac, .ogg)
   Архивы (.zip, .rar, .tar)
   ==Файлы перемещаются в соответствующие целевые директории==

5. Завершение - Выводится сообщение об успешном завершении сортировки

# Совместимость систем
Скрипт предназначен для:
* **Linux
* MacOS
Стоит сказать, что код, между этими двумя ОС, будет отличаться только путями. Для начало сделаем разбор для Linux, после уже для MacOS.

******

# Код для Linux систем:
#!/bin/bash
Source_dir="/home/username/Downloads" # ПОСТАВЬ СВОЁ ИМЯ ПОЛЬЗОВАТЕЛЯ!!!

Result_picture="/home/username/picture"  # ПОСТАВЬ СВОЁ ИМЯ ПОЛЬЗОВАТЕЛЯ!!!
Result_video="/home/username/video" # ПОСТАВЬ СВОЁ ИМЯ ПОЛЬЗОВАТЕЛЯ!!!
Result_music="/home/username/music"  # ПОСТАВЬ СВОЁ ИМЯ ПОЛЬЗОВАТЕЛЯ!!!
Result_documents="/home/username/documents"  # ПОСТАВЬ СВОЁ ИМЯ ПОЛЬЗОВАТЕЛЯ!!!
Result_archives="/home/username/archives"  # ПОСТАВЬ СВОЁ ИМЯ ПОЛЬЗОВАТЕЛЯ!!!

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

# Построчный разбор
******
# Shebang (шебанг) - что это?

shebang - это определение интерпретатора для выполнения скрипта. Грубо говоря, мы говорим системе что интерпретатор будет читать Bash скрипт.
#!/bin/bash

# Логика переменных

Инициализируем целевую переменную Source_dir и объявляем её как путь к директории Downloads.
Source_dir="/home/username/Downloads"

Именно из этой перемены мы будем брать файлы и распределять их по следующим директориям:
1. Целевая директория picture для перемены Result_picture.
2. Целевая директория video для перемены Result_video.
3. Целевая директория music для перемены Result_music.
4. Целевая директория documents для перемены Result_documents.
5. Целевая директория archives для перемены Result_archives.

Возможно, вы зададитесь вопросом, а что будет если у пользователя в системе не будет этих директорий, ему что, самому придется их создавать перед началом пользования скриптом!? - Создавать явно целевые директории будет не пользователь, а скрипт, благодаря следующей команде:
mkdir -p "$Result_picture" "$Result_video" "$Result_documents" "$Result_music" "$Result_archives"

ключевое слово mkdir в Bash (Bourne Again SHell) - это команда, которая создает директории в системе. После него стоит параметр -p, который служит созданием "недостающей" цепочки директорий.

Хотелось бы еще упомянуть две команды (echo, sleep)
1) команда echo - выводит текст определенный текст в терминал (в нашем случае - это Creating directories).
2) команда sleep делает паузу (прекращает работу) на определенное (фиксированное) время, в нашем случае - это 1, после пройденного времени, программа опять начинает работать дальше. Служит она просто ради некого реализма работы системы.

# Цикл и проверка

for file in "$Source_dir"/*; do
if [ -f "$file" ]; then
filename=$(basename "$file")

Здесь мы используем Цикл, в программировании их есть несколько типов, например цикл while, или же как в нашем случае for, они служат дублированием определенных действий, например, в нашем случае мы заставляем цикл for "перебирать" файлы в указанной директории.

Создаем цикл file который будет проверять все содержимое (*) целевой директории Downloads. Не забываем, что есть вероятность того, что в директории загрузок есть не только файлы, а так же директории, но нам нужно чтобы только файлы сортировались в заданные им директории, сделаем проверку:
if [ -f "$file" ]; then
filename=$(basename "$file")

В этом фрагменте кода присутствует условие if then, в bash их есть тоже несколько типов, как и с циклами, но затронем только этот. Условие в программировании - это проверка какого либо условия, оно может либо выполниться (в bash истину обозначают как 0), либо не выполниться (в том же bash ложь обозначают как 1).

Проверяем благодаря параметру -f является ли итерация файлом, если это так, то тогда создаем переменную filename, которая хранит следующее:
$(basename "$file")

ключевое слово basename - команда, которая извлекает имя файла (в том числе и его расширение). Например, если цикл найдет в целевой директории Downloads файл testfile.png, то у filename будет значение как testfile.png соответственно.

# Конструкция case

case (или его аналог в других языках программирования - switch case) - это конструкция в Bash, которая упрощает чтение кода, делает его более лаконичным и удобным из-за содержания множества условий в одном блоке.
Простыми словами, case - это тоже самое что и условия по типу if then, только более подходящая для больших количества условий (как в нашем случае, например).
Выглядит она так:
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

в самой верхней части кода мы ставим некое условие: "Если filename содержит в своем имени какой либо из ниже приведенных расширений файлов, то тогда перенаправляй в ту целевую директорию, которая её и соответствует".

* Стоит сказать что в Bash символ * - это любое имя (например, в нашем случае - любое имя файла).
* Символ | означает ИЛИ, то есть в условии нам позволяют проверить не только одно расширение, а сразу множество.
* Символ ;; означает конец одного условия.
* Символ *) - это кл. слово при котором мы даем понять конструкции case что мы бы хотели сделать условие по умолчанию (обычно его используют для вывода ошибки, если например, как в нашем случае, ни одно расширение файла не совпало с тем, что мы написали в условиях).

esac - ключевое слово, при котором мы даем понять конструкции case что мы хотим закончить целый блок условий.
fi - это конец условия (того самого, что был еще над case).
done - это конец цикла (находиться над условием if then).

конечный echo говорит нам о том, что все прошло хорошо, и сортировка файла прошло успешно.

******

# Код для MacOS систем:
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
