#-----------------------------------------------------
# Some usefull instructions...
#
BIBLIO=biblio.bib
#-----------------------------------------------------

README.html: README.adoc
	asciidoctor README.adoc

todos: 
	@echo "========================================"
	@echo "==> Generating the list of today's totos"
	grep "^fix " README.adoc 

check: 
	@echo "========================================"
	@echo "==> checking the fix "
	ruby tests/testfix0.rb README.adoc 

clean:
	rm -rf target
	rm -rf build
