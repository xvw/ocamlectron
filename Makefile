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
	rm -f example/app.bc.js

example: all
	(cd example; npm install)
	dune build example/app.bc.js
	cp _build/default/example/app.bc.js example/app.bc.js