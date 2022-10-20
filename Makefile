serve: clean
	bundle exec jekyll serve --livereload

build: clean
	JEKYLL_ENV=production bundle exec jekyll build

tailwind:
	rm -rf assets/css/output.css
	npx tailwindcss -i ./assets/css/input.css -o ./assets/css/output.css --watch

clean:
	rm -rf _site

.PHONY: serve build tailwind clean
