#!/bin/bash

Address_Book_File="address_book.txt"

display_menu() {
    menu_items=("Search Data" "View Data" "Add Data" "Remove Data" "Edit Data")
    echo "Address Book Menu"
    for i in ${!menu_items[@]}; do
        echo "$(($i+1)). ${menu_items[$i]}"
    done
}

add_data() {
    echo "Enter name:"
    read name
    echo "Enter address:"
    read addr
    echo "Enter Phone No.:"
    read phone
    echo "$name: $addr: $phone" >> "$Address_Book_File"
    echo "Entry Added Successfully"
}

view_data() {
    echo "Address Book Details"
    cat "$Address_Book_File"
}

while true; do

    display_menu
    read choice

    case $choice in
        2)  view_data; break;;
        3)  add_data; break;;
        4)  "Exit"; break;; 
    esac

    echo
done