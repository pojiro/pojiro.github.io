server: clean
	bundle exec jekyll serve --livereload

clean:
	rm -rf _site

.PHONY: server clean
