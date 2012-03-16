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

SOURCES = lexer.mll utils.ml parser.mly config.ml relationmatrix.ml callgraph.ml cycle.ml debug.ml fsafe.ml pprinter.ml wftype.ml typechecker.ml termination.ml handler.ml interpret.ml main.ml
EXEC = fsafe

CAMLC = ocamlc
CAMLOPT = ocamlopt
CAMLDEP = ocamldep
CAMLLEX = ocamllex
CAMLYACC = menhir

LIBS=$(WITHGRAPHICS)
CUSTOM=-custom

WITHGRAPHICS =graphics.cma -cclib -lgraphics -cclib -L/usr/X11R6/lib -cclib -lX11
WITHUNIX =unix.cma -cclib -lunix
WITHSTR =str.cma -cclib -lstr
WITHNUMS =nums.cma -cclib -lnums
WITHTHREADS =threads.cma -cclib -lthreads
WITHDBM =dbm.cma -cclib -lmldbm -cclib -lndbm


all: depend $(EXEC)

opt : $(EXEC).opt

SOURCES1 = $(SOURCES:.mly=.ml)
SOURCES2 = $(SOURCES1:.mll=.ml)
OBJS = $(SOURCES2:.ml=.cmo)
OPTOBJS = $(SOURCES2:.ml=.cmx)

$(EXEC): $(OBJS)
	$(CAMLC) $(CUSTOM) -o $(EXEC) $(LIBS) $(OBJS)

$(EXEC).opt: $(OPTOBJS)
	$(CAMLOPT) -o $(EXEC) $(LIBS:.cma=.cmxa) $(OPTOBJS)

.SUFFIXES:
.SUFFIXES: .ml .mli .cmo .cmi .cmx .mll .mly

.ml.cmo:
	$(CAMLC) -c $<

.mli.cmi:
	$(CAMLC) -c $<

.ml.cmx:
	$(CAMLOPT) -c $<

.mll.cmo:
	$(CAMLLEX) $<
	$(CAMLC) -c $*.ml

.mll.cmx:
	$(CAMLLEX) $<
	$(CAMLOPT) -c $*.ml

.mly.cmo:
	$(CAMLYACC) $<
	$(CAMLC) -c $*.mli
	$(CAMLC) -c $*.ml

.mly.cmx:
	$(CAMLYACC) $<
	$(CAMLOPT) -c $*.mli
	$(CAMLOPT) -c $*.ml

.mly.cmi:
	$(CAMLYACC) $<
	$(CAMLC) -c $*.mli

.mll.ml:
	$(CAMLLEX) $<

.mly.ml:
	$(CAMLYACC) $<

clean:
	rm -f *.cm[iox] *~ .*~ #*#
	rm -f $(EXEC)
	rm -f $(EXEC).opt

depend: $(SOURCES2)
	$(CAMLDEP) *.mli *.ml > .depend

include .depend
