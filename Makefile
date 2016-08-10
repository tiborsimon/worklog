.PHONY: publish
publish:
	python publish/publish.py
	git commit -am "Worklog updated."
	git checkout gh-pages
	git merge master
	git checkout master
	git push
