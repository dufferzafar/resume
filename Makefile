default: compile

compile:
	@pdflatex -file-line-error -halt-on-error -interaction=nonstopmode resume.tex

view:
	@qpdfview resume.pdf

clean:
	@rm *.aux
	@rm *.log
	@rm *.out
