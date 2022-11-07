(lang dune 3.0)

(name ebooklib)

(generate_opam_files true)

(source
 (github tomob/ocaml-ebooklib))

(authors "Tomasz Barański")
(maintainers "Tomasz Barański <tomasz.baranski@posteo.net>")
(license BSD-2-Clause)
(version 0.0)

; (documentation https://url/to/documentation)

(package
 (name ebooklib)
 (synopsis "ebooklib is an Ocaml library for managing epub files")
 (description "A longer description")
 (depends dune
  (ocaml (>= 4.08.0))
  (core (>= 0.15.1))
  (camlzip (>= 1.11))
  (labdasoup (>= 0.7.3))))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
