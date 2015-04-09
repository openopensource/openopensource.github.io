prepublish: index.html
start: prepublish
	http-server

index.html: Readme.md head.html foot.html package.json Makefile
	cat head.html > build.html
	## Change <project name> to This
	sed 's/&lt;project name&gt;/This/g' Readme.md >> build.md
	marked -i build.md >> build.html
	rm build.md
	cat foot.html >> build.html
	mv build.html index.html


clean:
	-rm index.html
	-rm build.html

.PHONY: prepublish start clean
