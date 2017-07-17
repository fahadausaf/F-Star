# For simplified Makefiles, define FSTAR_HOME, then include the file below.
FSTAR_HOME=../../everest/FStar

include $(FSTAR_HOME)/src/gmake/z3.mk
include $(FSTAR_HOME)/src/gmake/fstar.mk

include $(FSTAR_HOME)/ulib/ml/Makefile.include

# This target is very concise and re-uses the variables defined in
# Makefile.include. You shouldn't need to call `cp` ever.

out:
	mkdir -p out

ocaml: out UTF8.fst
	$(MAKE) -C $(ULIB_ML)
	$(FSTAR) $(FSTAR_DEFAULT_ARGS) --odir out --codegen OCaml UTF8.fst
	$(OCAMLOPT) out/UTF8.ml -o UTF8.exe
	./UTF8
