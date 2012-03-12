###############################################################################
#     This file is part of FSafe.                                             #
#                                                                             #
#     FSafe is free software: you can redistribute it and/or modify           #
#     it under the terms of the GNU General Public License as published by    #
#     the Free Software Foundation, either version 3 of the License, or       #
#     (at your option) any later version.                                     #
#                                                                             #
#     FSafe is distributed in the hope that it will be useful,                #
#     but WITHOUT ANY WARRANTY; without even the implied warranty of          #
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           #
#     GNU General Public License for more details.                            #
#                                                                             #
#     You should have received a copy of the GNU General Public License       #
#     along with FSafe.  If not, see <http://www.gnu.org/licenses/>.          #
#                                                                             #
#                                                                             #
# File        : Makefile                                                      #
#                                                                             #
###############################################################################

SRCS = $(wildcard *.ml *.mli *.mll *.mly)
TARGS = fsafe cycle
TARGS_WINDIR = _buildWin32
KIND = native
FLAGS = -w,Ae,-warn-error,A

all: $(TARGS)

fsafe: _build/main.$(KIND)
	cp $< $@
cycle: _build/cycle.$(KIND)
	cp $< $@
fswin.exe: _buildWin32/main.$(KIND)
	cp $< $@

_build/%.$(KIND): $(SRCS)
	ocamlbuild -use-menhir -classic-display -cflags $(FLAGS) -no-links $*.$(KIND)

$(TARGS_WINDIR)/%.$(KIND): $(SRCS)
	ocamlbuild -classic-display -cflags $(FLAGS) -no-links -build-dir $(TARGS_WINDIR) $*.$(KIND)

%.pdf: %.dot
	dot $< -Tpdf > $@

check: fsafe
	test/run.sh

clean:
	@ocamlbuild -classic-display -clean
	@rm -f *~ $(TARGS)
	@rm -f fswin.exe
	@rm -f callgraph.dot callgraph.png callgraph.pdf
	@ocamlbuild -classic-display -build-dir $(TARGS_WINDIR) -clean

.PHONY: all clean
