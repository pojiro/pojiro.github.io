serve: clean tailwind
	bundle exec jekyll serve --livereload

build: clean
	JEKYLL_ENV=production bundle exec jekyll build

fwatch:
	rm -rf ./assets/css/output.css
	fwatch

tailwind:
	npx tailwindcss -i ./assets/css/input.css -o ./assets/css/output.css

update:
	npm update tailwindcss

clean:
	rm -rf _site

.PHONY: serve build tailwind update clean
