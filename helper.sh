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

for name in $extensions; do
	chrome-cli open "https://chrome.google.com/webstore/detail/$name"
done

