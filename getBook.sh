#!/bin/bash

echo "Please enter the book ID (e.g rahaunt_00500205):"
read BOOK_ID

echo "\nPlease give the book a name:"
read BOOK_NAME

FIRST_LETTER=${BOOK_ID:0:1}

for i in $(seq -f "%04g" 1 100)
do
  echo "Page: $i"
  wget -q "http://www.childrenslibrary.org/library/books/$FIRST_LETTER/$BOOK_ID/thumbs2/$BOOK_ID-$i-thumb30.jpg"
  if [ "$?" -ne 0 ]; then
    break
  fi
done

convert *.jpg "$BOOK_NAME.pdf"

rm *.jpg
