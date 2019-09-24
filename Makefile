pdf: markdown-pdf
	markdown-pdf README.md -o JoshuaMervine.pdf

markdown-pdf:
	which markdown-pdf > /dev/null 2>&1 || npm i -g markdown-pdf
