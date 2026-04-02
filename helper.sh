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

# Install vscode extensions
vscode_extensions=( \
  dbaeumer.vscode-eslint \
  ms-vscode.vscode-typescript-tslint-plugin \
  msjsdiag.debugger-for-chrome \
)

for name in ${vscode_extensions[@]}; do
  code --install-extension $name
done
