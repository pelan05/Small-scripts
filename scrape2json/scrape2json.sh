title=$(grep -oP '(?<=lp-notification__headerDescription>).*?(?=<\/a>)' index.html)
link=$(grep -oP '(?<=lp-notification__headerContent><a href=).*?(?=class)' index.html | sed 's/ //g')
summary=$(grep -oP '(?<=lp-notification__contentSummary>).*?(?=<\/div>)' index.html)
echo -e "{\"title\": \"$title\", \"link\": \"$link\", \"summary\": \"$summary\"}" > latestAnnouncement.json