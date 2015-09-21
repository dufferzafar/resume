default: compile

compile:
	@latexmk -silent -pdf -pdflatex='pdflatex -interaction=nonstopmode' resume.tex

error:
	@latexmk -pdf -pdflatex='pdflatex -file-line-error -interaction=errorstopmode' resume.tex

view:
	@qpdfview resume.pdf

# Clean all latex crap
clean:
	@rm *.aux
	@rm *.log
	@rm *.out

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
