server:
	rm -rf _site
	bundle exec jekyll serve --livereload

tailwind:
	rm -rf assets/css/output.css
	npx tailwindcss -i ./assets/css/input.css -o ./assets/css/output.css --watch

.PHONY: server
