convert: setup
	node ./convert.js

setup:
	npm install

clean:
	-rm -rf node_modules
	-rm JoshuaMervine.pdf
