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
        echo "Enter image path (optional):"
        read IMAGE
        echo "Enter tags (comma-separated, optional):"
        read TAGS

        FILE_PATH="$POSTS_DIR/$SLUG.md"
        cat <<EOF > "$FILE_PATH"
---
slug: $SLUG
title: "$TITLE"
description: "$DESCRIPTION"
image: "$IMAGE"
date: $DATE
lastmod: $LASTMOD
hidden: false
tags: [$(echo "$TAGS" | sed 's/, /", "/g')]
---
EOF
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
        cat <<EOF > "$FILE_PATH"
{
    "title": "$TITLE",
    "src": "$SRC",
    "place": "$PLACE",
    "time": "$TIME",
    "width": $WIDTH,
    "height": $HEIGHT
}
EOF
        ;;
    "work")
        echo "Enter title:"
        read TITLE
        echo "Enter date (YYYY-MM-DD):"
        read WORK_DATE
        echo "Enter type (youtube/tweet/image/text):"
        read TYPE
        echo "Enter content:"
        read CONTENT
        echo "Enter description (optional):"
        read DESCRIPTION
        echo "Enter thumbnail (optional):"
        read THUMBNAIL

        FILE_PATH="$WORK_DIR/$(echo $TITLE | tr ' ' '-').json"
        cat <<EOF > "$FILE_PATH"
{
    "title": "$TITLE",
    "date": "$WORK_DATE",
    "type": "$TYPE",
    "content": "$CONTENT",
    "description": "$DESCRIPTION",
    "thumbnail": "$THUMBNAIL"
}
EOF
        ;;
    *)
        echo "Invalid option. Please choose 'post', 'photo', or 'work'."
        exit 1
        ;;
esac

# Confirm file creation
echo "File created: $FILE_PATH"
