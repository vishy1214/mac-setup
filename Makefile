# Make file to help make this easy

all: settings make-exec set-defaults install-all

settings:
	cp settings_example .settings

make-exec:
	chmod +x mac-defaults.sh
	chmod +x mac-installs.sh
	chmod +x mac-install-apps.sh
	chmod +x mac-install-appstore.sh
	chmod +x mac-install-cli-apps.sh

set-defaults:
	./mac-defaults.sh

install-all:
	./mac-installs.sh
	./mac-install-apps.sh
	./mac-install-appstore.sh
	./mac-install-cli-apps.sh

install-apps:
	./mac-install-apps.sh

install-appstore':
	./mac-install-appstore.sh

install-cli-apps:
	./mac-install-cli-apps.sh

