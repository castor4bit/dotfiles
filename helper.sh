# Open chrome extension install pages
chrome_extensions=( \
	1password-x-–-password-ma/aeblfdkhhhdcdjpifhhbdiojplfjncoa \
	vimium/dbepggeogbaibhgnhhndojpepiihcmeb \
	website-ip/ghbmhlgniedlklkpimlibbaoomlpacmk \
	deepl-translate-reading-w/cofdbpoegempjloogbagkncekinflcnj \
)

for name in ${chrome_extensions[@]}; do
	chrome-cli open "https://chrome.google.com/webstore/detail/$name"
done
