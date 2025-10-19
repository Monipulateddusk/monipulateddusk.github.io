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

# Get the raw text of our template website and copy it's contents to the extra files to be created
TEMPLATE_WEBSITE_TEXT=

for i in {1..5}; do
    touch "file$i".html
    # Create the HTML boilerplate
    echo "$header" > "file$i.html"

    # Create the testing HTML code
    echo "$testFunctionality" >> "file$i.html"

    # Create the footer for the HTML doc
    echo "$footer" >> "file$i.html"
done