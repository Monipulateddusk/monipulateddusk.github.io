#!/bin/sh

# Path to the main script directory - allowing us to get other folders within the root
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Because this bash file is in our root, 
# we can get the path to the destination folder like so
PROJECT_HTML_PAGES_PATH="$SCRIPT_DIR/ProjectHTMLPages"

function CreateHTMLPage(){
    # Declare parameters as locations in the declaration. For example, fileName will be assigned to whatever is first when calling CreateHTMLPage. E.g. CreateHTMLPage "File1"
    local FILE_NAME=$1
    local TITLE=$2
    local DESCRIPTION=$3
    local IMAGE_PATHS=$4

    # Go into the Project Pages folder. 
    # It is in "" to allow it to work an arguement if the directory contains spaces.
    cd "$PROJECT_HTML_PAGES_PATH/Projects"

    touch "$FILE_NAME".html

    # Get the raw text of our template website and copy it's contents to the extra files to be created
    while IFS= read -r LINE; do
        # Check the line. Does it contain 'PROJECT_TITLE'? If so, replace with a temp var for now
        if grep -q "PROJECT_TITLE" <<< "$LINE"; then
            echo "${LINE/PROJECT_TITLE/$TITLE}" >> "$FILE_NAME".html

        # Check the line. Does it contain 'PROJECT_DESC'? If so, replace with a temp var for now
        elif grep -q "PROJECT_DESC" <<< "$LINE"; then
            echo "${LINE/PROJECT_DESC/$DESCRIPTION}" >> "$FILE_NAME".html
        
        # Check the line. Does it contain 'PROJECT_IMAGE'? If so, replace with a temp var for now
        elif grep -q "PROJECT_IMAGE" <<< "$LINE"; then
            echo "${LINE/PROJECT_IMAGE/$IMAGE_PATHS}" >> "$FILE_NAME".html

        else
            echo "$LINE" >> "$FILE_NAME".html

        fi
    done < "$PROJECT_HTML_PAGES_PATH/_ProjectPageTemplate.html"
}

function ReadENVFile(){
    # Clear the contents of the Projects subfolder. The '*' allows bash to not care about the names of the folders, just to delete all files and folders within the specified directory
    rm -rf "$PROJECT_HTML_PAGES_PATH"/Projects/*

    # Get the .env file
    source "$SCRIPT_DIR"/ProjectData.env

    for i in $( seq 1 $PROJECT_COUNT); do
        # Declare name, desc and image vars. We use this with Indirect Parameter Expression to get the variable named inside the value declared. 
        # E.g. if in our name var we have: 'PROJECT1_NAME' we will get:'Project1' from our ProjectData.env file
        name="PROJECT${i}_NAME"
        desc="PROJECT${i}_DESC"
        img="PROJECT${i}_IMAGE"
        CreateHTMLPage "${!name}" "${!name}" "${!desc}" "${!img}"
    done

}

ReadENVFile


read -p "PROGRAM DONE! PRESS 'ENTER' TO CLOSE!"



