COMPILATEUR = ocamlc
ELEMENTS = Matrix_of_relation Print_of_matrices tests_for_matrices

.DEFAULT : aide
aide :
	@echo "make { test | clean | superclean }"

test : $(foreach ELEMENT,${ELEMENTS},${ELEMENT}.cmo)
	@${COMPILATEUR} unix.cma $+ -o $@ \
	&& echo "Le fichier \"$@\" a été créé avec succès."

.INTERMEDIATE : %.cmo %.cmi
%.cmo : %.ml
	@${COMPILATEUR} -c $< *.cmo

.PHONY : clean
clean :
	@rm -fv *.cm*

.PHONY : superclean
superclean :
	@make clean
	@rm -fv test
