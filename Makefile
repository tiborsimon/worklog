.PHONY: publish install uninstall
publish:
	python publish/publish.py
	git commit -am "Worklog updated."
	git push

install:
	ln -sf ${PWD}/add/wl ~/.dotfiles/bin/wl

uninstall:
	rm -f $(shell which wl)
