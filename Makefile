default: clean compile

compile:
	@latexmk -silent -pdf -pdflatex='pdflatex -interaction=nonstopmode' resume.tex

error:
	@latexmk -pdf -pdflatex='pdflatex -file-line-error -interaction=errorstopmode' resume.tex

view:
	@xdg-open resume.pdf

# Clean all latex crap
clean:
	@rm -f *.aux
	@rm -f *.fls
	@rm -f *.log
	@rm -f *.out
	@rm -f *.fdb_latexmk

# Print all URLs being used
.PHONY: urls
urls:
	@./ls-urls

# Run the watch shell script that
# watches the current directory for changes and builds the PDF
.PHONY: watch
watch:
	@./watch

# Build resume
build: compile
	@cp resume.pdf build/Shadab\ Zafar.pdf

# Push to build branch on Github
push: build
	@ cd build && \
		git add -u && \
		git commit -m "Resume Generated On: `date +'%Y-%m-%d %H:%M:%S'`"
		git push origin build
