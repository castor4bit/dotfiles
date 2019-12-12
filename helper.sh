# Open chrome extension install pages
extensions=( \
	autopagerize/igiofjhpmpihnifddepnpngfjhkfenbp \
	go-back-with-backspace/eekailopagacbcdloonjhbiecobagjci \
	hatebu/dnlfpnhinnjdgmjfpccajboogcjocdla \
	raindropio/ldgfbffkinooeloadekpmfoklnobpien \
	vimium/dbepggeogbaibhgnhhndojpepiihcmeb \
	website-ip/ghbmhlgniedlklkpimlibbaoomlpacmk \
	yslow/ninejjcohidippngpapiilnmkgllmakh \
)

for name in ${extensions[@]}; do
	chrome-cli open "https://chrome.google.com/webstore/detail/$name"
done
