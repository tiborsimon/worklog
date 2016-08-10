.PHONY: publish
publish:
	python publish/publish.py
	git add --all
	git commit -m "Worklog added."
	git checkout gh-pages
	git merge master
	git checkout master
	git push
