;;;; SPDX-FileCopyrightText: (#| TMPL_VAR author |#)
;;;; SPDX-License-Identifier: (#| TMPL_VAR license |#)

(in-package :asdf)

(defsystem "(#| TMPL_VAR name |#)"
  :description "Describe (#| TMPL_VAR name |#) here"
  :author "(#| TMPL_VAR author |#)"
  :homepage "https://codeberg.org/aartaka/(#| TMPL_VAR name |#)"
  :bug-tracker "https://codeberg.org/aartaka/(#| TMPL_VAR name |#)/issues"
  :source-control (:git "https://codeberg.org/aartaka/(#| TMPL_VAR name |#).git")
  :license  "(#| TMPL_VAR license |#)"
  :version "0.0.0"(#| TMPL_IF depends-on |#)
  :depends-on (#| TMPL_VAR dependencies-string |#)(#| /TMPL_IF |#)
  :serial t
  :pathname "source/"
  :components ((:file "package")
               (:file "(#| TMPL_VAR name |#)"))
  :in-order-to ((test-op (test-op "(#| TMPL_VAR name |#)/tests"))))

(defsystem "(#| TMPL_VAR name |#)/tests"
  :depends-on ("(#| TMPL_VAR name |#)" "lisp-unit2")
  :serial t
  :pathname "tests/"
  :components ((:file "package")
               (:file "tests"))
  :perform (test-op (op c)
                    (eval-input
                     "(lisp-unit2:run-tests
                       :package :(#| TMPL_VAR name |#)/tests
                       :run-contexts #'lisp-unit2:with-summary-context)")))
