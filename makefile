LISP ?= sbcl
SBCL_FLAGS =
ifeq ($(LISP), sbcl)
	SBCL_FLAGS = --dynamic-space-size 1024 --no-userinit --non-interactive
endif
LISP_FLAGS ?= $(SBCL_FLAGS)
DESTDIR ?= /usr/bin

export CL_SOURCE_REGISTRY := $(realpath deps/)//:$(CL_SOURCE_REGISTRY)

.PHONY: all
all: laliza

.PHONY: clean
clean:
	rm laliza

laliza:
	$(LISP) $(LISP_FLAGS) --eval '(require "asdf")' --load (#| TMPL_VAR name |#).asd --eval '(asdf:load-system :(#| TMPL_VAR name |#))' --eval '(asdf:make :(#| TMPL_VAR name |#))' --eval '(quit)'


.PHONY: tests
tests:
	$(LISP) $(LISP_FLAGS) --eval '(require "asdf")' --load (#| TMPL_VAR name |#).asd --eval '(asdf:test-system :(#| TMPL_VAR name |#))' --eval '(quit)'

.PHONY: repl
repl:
	$(LISP) $(LISP_FLAGS) --eval '(require "asdf")' --load (#| TMPL_VAR name |#).asd --eval '(asdf:load-system :(#| TMPL_VAR name |#))'
