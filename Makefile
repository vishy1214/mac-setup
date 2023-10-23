# Make file to help make this easy
settings:
	cp settings_example .settings

make-exec:
	chmod +x mac-defaults.sh
	chmod +x mac-installs.sh

set-defaults:
	./mac-defaults.sh

install-apps:
	./mac-installs.sh

