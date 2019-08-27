gen-site:
	hugo
	rm config.toml content/ README.md resources/ static/ themes/ -rf
	mv public/* .
	rmdir public
	rm Makefile
	git add -A
	git commit -m 'deploy new website'
