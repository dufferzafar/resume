default: compile

compile:
	@latexmk -silent -pdf -pdflatex='pdflatex -file-line-error' resume.tex

view:
	@qpdfview resume.pdf

clean:
	@rm *.aux
	@rm *.log
	@rm *.out
