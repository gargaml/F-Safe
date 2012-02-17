SRCS = $(wildcard *.ml *.mli *.mll *.mly)
TARGS = fsafe
TARGS_WINDIR = _buildWin32
KIND = native
FLAGS = -w,Ae,-warn-error,A

all: $(TARGS)

fsafe: _build/main.$(KIND)
	cp $< $@

fswin.exe: _buildWin32/main.$(KIND)
	cp $< $@

_build/%.$(KIND): $(SRCS)
	ocamlbuild -use-menhir -classic-display -cflags $(FLAGS) -no-links $*.$(KIND)

$(TARGS_WINDIR)/%.$(KIND): $(SRCS)
	ocamlbuild -classic-display -cflags $(FLAGS) -no-links -build-dir $(TARGS_WINDIR) $*.$(KIND)

check: fsafe
	test/run.sh

clean:
	@ocamlbuild -classic-display -clean
	@rm -f *~ $(TARGS)
	@rm -f fswin.exe
	@ocamlbuild -classic-display -build-dir $(TARGS_WINDIR) -clean

.PHONY: all clean
