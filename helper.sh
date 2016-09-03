# Open chrome extension install pages
extensions=( \
	autopagerize/igiofjhpmpihnifddepnpngfjhkfenbp \
	go-back-with-backspace/eekailopagacbcdloonjhbiecobagjci \
	google-docs/aohghmighlieiainnegkcijnfilokake \
	hatebu/dnlfpnhinnjdgmjfpccajboogcjocdla \
	onetab/chphlpgkkbolifaimnlloiipkdnihall \
	vimium/dbepggeogbaibhgnhhndojpepiihcmeb \
	website-ip/ghbmhlgniedlklkpimlibbaoomlpacmk \
	yslow/ninejjcohidippngpapiilnmkgllmakh \
)

for name in ${extensions[@]}; do
	chrome-cli open "https://chrome.google.com/webstore/detail/$name"
done

# Install vagrant plugins
vagrant plugin install sahara
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-aws
vagrant plugin install vagrant-cachier

# Yogafire
#cpanm install LWP::Protocol::https --force
#cpanm https://github.com/toritori0318/p5-Yogafire/tarball/master

# rsense init
ruby /usr/local/opt/rsense/libexec/etc/config.rb > ~/.rsense

# git-contrib
ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin
