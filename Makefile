.PHONY: clean

all: build doc

build: 
	dune build

install:
	dune install

doc:
	dune build @doc

clean:
	dune clean