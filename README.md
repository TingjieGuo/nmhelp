```zsh
# Rename all .htm files to .html
find ./ -name "*.htm" -exec bash -c 'mv "$0" "${0%.htm}.html"' {} \;

# Tem all .html references in files with .hhttmmll
find ./ -type f -name "*.html" -exec sed -i '' 's/html/hhttmmll/g' {} \;

# Replace all .htm references in files with .html
find ./ -type f -name "*.html" -exec sed -i '' 's/htm/html/g' {} \;

# Change .hhttmmll back to .html
find ./ -type f -name "*.html" -exec sed -i '' 's/hhttmmll/html/g' {} \;
```