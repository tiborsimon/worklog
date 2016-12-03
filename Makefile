.PHONY: publish install uninstall
publish:
	python publish/publish.py
	git commit -am "Worklog updated."
	git checkout gh-pages
	git merge master -m "Master merged."
	git checkout master
	git push

install:
	ln -sf ${PWD}/add/wl ~/.dotfiles/bin/wl

uninstall:
	rm -f $(shell which wl)
