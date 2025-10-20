# Для кого предназначена документация?

Данная API документация предназначено для разработчиков, которые хотят понять структуру и логику скрипта для возможной модификации или интеграции. Описание будет техническим, но с пояснениями ключевых моментов.

==ВАЖНО!== Если вы хотите подробное объяснение для начинающих, перейдите в раздел документации для начинающих.

# Что делает скрипт?
Скрипт служит сортированием файлов разных расширений в соответствующие им директории.

# Логика скрипта

1. **Инициализация путей** - Определяются исходная директория (`Source_dir`) и целевые директории для разных типов файлов

2. **Создание директорий** - Проверяется существование целевых папок, при отсутствии - создаются

3. **Цикл обработки файлов** - Для каждого файла в исходной директории:- Определяется расширение файла

4. Выполняется классификация по следующим типам:
   **Изображения** (.jpg, .jpeg, .png, .gif, .bmp)
   **Видео** (.mp4, .avi, .mkv, .wmv, .flv)
   **Документы** (.pdf, .doc, .docx, .txt, .rtf, .xls, .xlsx, .ppt, .pptx)

   **Аудио** (.mp3, .wav, .aac, .ogg)
   **Архивы** (.zip, .rar, .tar)
   ==Файлы перемещаются в соответствующие целевые директории==

5. **Завершение** - Выводится сообщение об успешном завершении сортировки

# Совместимость систем
**Скрипт предназначен для:
* **Linux**
* **MacOS**
Стоит сказать, что код, между этими двумя ОС, будет отличаться только путями. Для начало сделаем разбор для Linux, после уже для MacOS.

******

# Код для Linux систем:
```bash
#!/bin/bash
Source_dir="/home/username/Downloads" # ПОСТАВЬ СВОЁ ИМЯ ПОЛЬЗОВАТЕЛЯ ВМЕСТО `username`!!!
Result_picture="/home/username/picture"  # ПОСТАВЬ СВОЁ ИМЯ ПОЛЬЗОВАТЕЛЯ ВМЕСТО `username`!!!
Result_video="/home/username/video" # ПОСТАВЬ СВОЁ ИМЯ ПОЛЬЗОВАТЕЛЯ ВМЕСТО `username`!!!
Result_music="/home/username/music" # ПОСТАВЬ СВОЁ ИМЯ ПОЛЬЗОВАТЕЛЯ ВМЕСТО `username`!!!
Result_documents="/home/username/documents" # ПОСТАВЬ СВОЁ ИМЯ ПОЛЬЗОВАТЕЛЯ ВМЕСТО `username`!!!
Result_archives="/home/username/archives" # ПОСТАВЬ СВОЁ ИМЯ ПОЛЬЗОВАТЕЛЯ ВМЕСТО `username`!!!

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

# Архитектура API (Построчный разбор)
******
# Логика переменных

Инициализируем целевую переменную `Source_dir` и объявляем её как путь к директории `Downloads`.
```bash
Source_dir="/home/username/Downloads"
```

Именно из этой перемены мы будем брать файлы и распределять их по следующим директориям:
1. Целевая директория `picture` - приемник изображений
2. Целевая директория `video` - приемник видео
3. Целевая директория `music` - приемник аудио
4. Целевая директория `documents` - приемник документов
5. Целевая директория `archives` - приемник архивов

# Команда mkdir -p
```bash
mkdir -p "$Result_picture" "$Result_video" "$Result_documents" "$Result_music" "$Result_archives"
```

**Назначение:** Рекурсивное создание директорий по соответствующим переменным.
**Флаг:** `-p` - создание цепочки директорий.

# Цикл и проверка
### Цикл: `for file in "$Source_dir"/*`

```bash
for file in "$Source_dir"/*; do
```

**Назначение:** перебор элементов исходной директории


### Условие: `if [ -f "$file" ]`

```bash
if [ -f "$file" ]; then
```

**Тип:** проверка типа элемента
**Флаг:** `-f` - проверка на файл
**Возврат:** boolean (0 - файл, 1 - не файл)


Если `$file` == 0, выполни следующее:
```bash
filename=$(basename "$file")
```

#### функция `basename`:
**Назначение:** извлечение имени файла с расширением
**Вход:** полный путь к файлу
**Выход:** имя файла с расширением


# Конструкция case

**Тип:** мульти-условный оператор
**Назначение:** маршрутизация файлов по расширениям
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

#### Классификация:

* **Изображения** (.jpg, .jpeg, .png, .gif, .bmp)
* **Видео** (.mp4, .avi, .mkv, .wmv, .flv)
* **Документы** (.pdf, .doc, .docx, .txt, .rtf, .xls, .xlsx, .ppt, .pptx)
* **Аудио** (.mp3, .wav, .aac, .ogg)
* **Архивы** (.zip, .rar, .tar)

******

# Код для MacOS систем:
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

можешь сделать эту документацию на английском техническом
