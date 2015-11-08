# Open chrome extension install pages
extensions=( \
	autopagerize/igiofjhpmpihnifddepnpngfjhkfenbp \
	google-docs/aohghmighlieiainnegkcijnfilokake \
	hatebu/dnlfpnhinnjdgmjfpccajboogcjocdla \
	onetab/chphlpgkkbolifaimnlloiipkdnihall \
	vimium/dbepggeogbaibhgnhhndojpepiihcmeb \
	pagespeed-insights-by-goo/gplegfbjlmmehdoakndmohflojccocli \
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
cpanm install LWP::Protocol::https --force
cpanm https://github.com/toritori0318/p5-Yogafire/tarball/master

# rbenv plugins
mkdir -p ~/.rbenv/plugins
cd ~/.rbenv/plugins
git clone https://github.com/sstephenson/rbenv-vars.git
git clone https://github.com/sstephenson/rbenv-gem-rehash.git
git clone https://github.com/ianheggie/rbenv-binstubs.git

# git-contrib
ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin
