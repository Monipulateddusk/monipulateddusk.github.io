#!/bin/bash

# Create a header variable with the HTML boilerplate 
# so when we combine the variables together we create HTML file
read -r -d '' header <<EoF
<!DOCTYPE html>

<html>
<body>

<h1>Test<h1>

EoF

read -r -d '' footer <<EoF
</body>
</html>

EoF

read -r -d '' testFunctionality <<EoF
<h2> THIS IS MORE TESTING </h2>


EoF

printf "%s/n" "$header"
for file in "$@";do
    printf "$testFunctionality" "$file"
done
printf "%s\n" "$footer"