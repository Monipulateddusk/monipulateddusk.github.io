#!/bin/sh

# Path to the main script directory - allowing us to get other folders within the root
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Because this bash file is in our root, 
# we can get the path to the destination folder like so
PROJECT_HTML_PAGES_PATH="$SCRIPT_DIR/ProjectHTMLPages"

# Create a header variable with the HTML boilerplate 
# so when we combine the variables together we create HTML file

# As we copied this from our index, we need to include '..\' at the start of the file
# path to get our favicon image as we aren't in our root anymore
read -r -d '' header <<EoF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!--    Connect to the Google Fonts page for use of their fonts.    -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    
    <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:ital,wght@0,100..800;1,100..800&family=Pixelify+Sans:wght@400..700&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="..\style.css">
    <title>Nathan Brennan Portfolio</title>
    
    <!--    Used RealFaviconGenerator to create Multi-Platform versions of my Favicon   -->
    <link rel="icon" type="image/png" href="..\Images\Icons\Favicon\favicon.svg" sizes="96x96">
    <link rel="icon" type="image/svg+xml" href="..\Images\Icons\Favicon\favicon.svg" />
    <link rel="shortcut icon" href="..\Images\Icons\Favicon\favicon.ico" />
    <link rel="apple-touch-icon" sizes="180x180" href="..\Images\Icons\Favicon\apple-touch-icon.png" />
    <link rel="manifest" href="..\Images\Icons\Favicon\site.webmanifest" />
</head>
<body style="position:relative; left: 0%;">

EoF


read -r -d '' testFunctionality <<EoF

    <h2> THIS IS MORE TESTING </h2>

EoF

read -r -d '' footer <<EoF

</body>
</html>

EoF

# Go into the Project Pages folder. 
# It is in "" to allow it to work an arguement if the directory contains spaces.
cd "$PROJECT_HTML_PAGES_PATH"

# Declare temp vars to test string substitution
TEMP_TITLE="This is a temp title. HUEHUEHUEHEUHEUE"
TEMP_DESC="This is a temp Description. The FitnessGram™ Pacer Test is a multistage aerobic capacity test that progressively gets more difficult as it continues. The 20 meter pacer test will begin in 30 seconds. Line up at the start. The running speed starts slowly, but gets faster each minute after you hear this signal. [beep] A single lap should be completed each time you hear this sound. [ding] Remember to run in a straight line, and run as long as possible. The second time you fail to complete a lap before the sound, your test is over. The test will begin on the word start. On your mark, get ready, start."
TEMP_IMAGE_PATH="../Images/Icons/GCULogo.svg"

for i in {1..5}; do
    touch "file$i".html

    # Get the raw text of our template website and copy it's contents to the extra files to be created
    while IFS= read -r LINE; do
        # Check the line. Does it contain 'PROJECT_TITLE'? If so, replace with a temp var for now
        if grep -q "PROJECT_TITLE" <<< "$LINE"; then
            echo "${LINE/PROJECT_TITLE/$TEMP_TITLE}" >> "file$i".html

        # Check the line. Does it contain 'PROJECT_DESC'? If so, replace with a temp var for now
        elif grep -q "PROJECT_DESC" <<< "$LINE"; then
            echo "${LINE/PROJECT_DESC/$TEMP_DESC}" >> "file$i".html
        
        # Check the line. Does it contain 'PROJECT_IMAGE'? If so, replace with a temp var for now
        elif grep -q "PROJECT_IMAGE" <<< "$LINE"; then
            echo "${LINE/PROJECT_IMAGE/$TEMP_IMAGE_PATH}" >> "file$i".html

        else
            echo "$LINE" >> "file$i".html

        fi
    done < "$PROJECT_HTML_PAGES_PATH/_ProjectPageTemplate.html"


done

read _