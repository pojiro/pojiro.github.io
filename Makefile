serve: clean tailwind
	bundle exec jekyll serve --livereload

build: clean
	JEKYLL_ENV=production bundle exec jekyll build

eswatch:
	rm -rf ./assets/css/output.css
	eswatch

tailwind:
	npx tailwindcss -i ./assets/css/input.css -o ./assets/css/output.css

clean:
	rm -rf _site

.PHONY: serve build tailwind clean
