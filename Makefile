default: compile

compile:
	@latexmk -silent -pdf -pdflatex='pdflatex -interaction=nonstopmode' resume.tex

error:
	@latexmk -pdf -pdflatex='pdflatex -file-line-error -interaction=errorstopmode' resume.tex

copy: compile
	@cp resume.pdf "Shadab Zafar.pdf"

view:
	@qpdfview resume.pdf

clean:
	@rm *.aux
	@rm *.log
	@rm *.out

.PHONY: watch
watch:
	@./watch
