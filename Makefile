.PHONY: clean

all: clean_bc build doc

build: 
	dune build

install:
	dune install

doc:
	dune build @doc

clean:
	dune clean

clean_bc:
	rm -f example/*.bc.js

install_example: all
	(cd example; npm install)

example: all 
	dune build example/main.bc.js
	cp _build/default/example/main.bc.js example/main.bc.js
