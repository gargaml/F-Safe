SRCS = $(wildcard *.ml *.mli *.mll *.mly)
TARGS = fsafe
KIND = native
FLAGS = -w,Ae,-warn-error,A

all: $(TARGS)

fsafe: _build/fsafe.$(KIND)
	cp $< $@

_build/%.$(KIND): $(SRCS)
	ocamlbuild -cflags $(FLAGS) -no-links $*.$(KIND)

clean:
	@ocamlbuild -clean
	@rm -f *~ $(TARGS)

.PHONY: all clean