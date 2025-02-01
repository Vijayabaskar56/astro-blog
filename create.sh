#!/bin/bash

# Define directories
POSTS_DIR="src/content/posts"
PHOTOS_DIR="src/content/photos"
WORK_DIR="src/content/work"

# Ask what type of content to create
echo "What do you want to create? (post/photo/work)"
read TYPE

# Generate timestamps
DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
LASTMOD=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Handle user selection
case "$TYPE" in
    "post")
        echo "Enter slug (filename):"
        read SLUG
        echo "Enter title:"
        read TITLE
        echo "Enter description (optional):"
        read DESCRIPTION
        echo "Enter tags (comma-separated, optional):"
        read TAGS

        FILE_PATH="$POSTS_DIR/$SLUG.md"
        echo "---" > "$FILE_PATH"
        echo "slug: $SLUG" >> "$FILE_PATH"
        echo "title: $TITLE" >> "$FILE_PATH"
        [[ -n "$DESCRIPTION" ]] && echo "description: $DESCRIPTION" >> "$FILE_PATH"
        echo "image: ../attachments/100.jpg" >> "$FILE_PATH"
        echo "date: $DATE" >> "$FILE_PATH"
        echo "lastmod: $LASTMOD" >> "$FILE_PATH"
        echo "hidden: false" >> "$FILE_PATH"
        [[ -n "$TAGS" ]] && echo "tags: [$(echo "$TAGS" | sed 's/, /", "/g')]" >> "$FILE_PATH"
        echo "---" >> "$FILE_PATH"
        ;;
    "photo")
        echo "Enter title:"
        read TITLE
        echo "Enter source path:"
        read SRC
        echo "Enter place:"
        read PLACE
        echo "Enter time (YYYY-MM-DD format):"
        read TIME
        echo "Enter width:"
        read WIDTH
        echo "Enter height:"
        read HEIGHT

        FILE_PATH="$PHOTOS_DIR/$(echo $TITLE | tr ' ' '-').json"
        echo "{" > "$FILE_PATH"
        echo "    \"title\": \"$TITLE\"," >> "$FILE_PATH"
        echo "    \"src\": \"$SRC\"," >> "$FILE_PATH"
        echo "    \"place\": \"$PLACE\"," >> "$FILE_PATH"
        echo "    \"time\": \"$TIME\"," >> "$FILE_PATH"
        echo "    \"width\": $WIDTH," >> "$FILE_PATH"
        echo "    \"height\": $HEIGHT" >> "$FILE_PATH"
        echo "}" >> "$FILE_PATH"
        ;;
    "work")
        echo "Enter title:"
        read TITLE
        echo "Enter date (YYYY-MM-DD):"
        read WORK_DATE
        echo "Enter type (youtube/tweet/image/text):"
        read WORK_TYPE
        echo "Enter content:"
        read CONTENT
        echo "Enter description (optional):"
        read DESCRIPTION
        echo "Enter thumbnail (optional):"
        read THUMBNAIL

        FILE_PATH="$WORK_DIR/$(echo $TITLE | tr ' ' '-').json"
        echo "{" > "$FILE_PATH"
        echo "    \"title\": \"$TITLE\"," >> "$FILE_PATH"
        echo "    \"date\": \"$WORK_DATE\"," >> "$FILE_PATH"
        echo "    \"type\": \"$WORK_TYPE\"," >> "$FILE_PATH"
        echo "    \"content\": \"$CONTENT\"" >> "$FILE_PATH"
        [[ -n "$DESCRIPTION" ]] && echo "    ,\"description\": \"$DESCRIPTION\"" >> "$FILE_PATH"
        [[ -n "$THUMBNAIL" ]] && echo "    ,\"thumbnail\": \"$THUMBNAIL\"" >> "$FILE_PATH"
        echo "}" >> "$FILE_PATH"
        ;;
    *)
        echo "Invalid option. Please choose 'post', 'photo', or 'work'."
        exit 1
        ;;
esac

# Confirm file creation
echo "File created: $FILE_PATH"
