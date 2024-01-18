#!/bin/bash

Address_Book_File="address_book.txt"

display_menu() {
    menu_items=("Search Data" "View Data" "Add Data" "Remove Data" "Edit Data" "Exit")
    echo "Address Book Menu"
    for i in ${!menu_items[@]}; do
        echo "$(($i+1)). ${menu_items[$i]}"
    done
}

add_data() {
    read -p "Enter name:" name
    read -p "Enter address:" addr
    read -p "Enter Phone No.:" phone
    echo "$name: $addr: $phone" >> "$Address_Book_File"
    echo "Entry Added Successfully"
}

edit_data() {
    read -p "Enter the name:" name
    grep -q "^$name" "$Address_Book_File"
    if [ $? -eq 1 ]; then 
        echo "DETAILS NOT FOUND"
        return
    fi
    read -p "Enter the new name:" n_name
    read -p "Enter the new address:" n_addr
    read -p "Enter the new phone number:" n_phn

    grep -v "^$name" "$Address_Book_File" > temp
    echo "$n_name: $n_addr: $n_phn" >> temp
    mv temp "$Address_Book_File"

    echo "Data Edited Successfully"
}

view_data() {
    cat "$Address_Book_File"
}

search_data() {
    read -p "Enter name:" name
    grep -q "$name" "$Address_Book_File"
    if [ $? -eq 1 ]; then
        echo "DETAILS NOT FOUND"
        return
    fi
    grep -i "$name" "$Address_Book_File"
}

remove_data() {
    read -p "Enter Phone Number:" phn
    grep -q "$phn" "$Address_Book_File"
    if [ $? -eq 0 ]; then
    # remove data on the basis of phone number since phone number is unique
        grep -v "$phn" "$Address_Book_File" > temp && mv temp "$Address_Book_File"
        echo "Data deleted successfully"
    else
        echo "Details not found"
    fi
}

while true; do

    display_menu
    read -p "Enter Your Choice:" choice

    case $choice in
        1)  search_data; break;;
        2)  view_data; break;;
        3)  add_data; break;;
        4)  remove_data; break;;
        5)  edit_data; break;;
        6)  break;; 
    esac
done