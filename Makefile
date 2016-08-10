.PHONY: publish
publish:
	python publish_json.py
	git add --all
	git commit -m "Worklog added."
	git checkout gh-pages
	git merge master
	git push
	git checkout master 
	git push


