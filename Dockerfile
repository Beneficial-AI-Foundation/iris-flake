FROM ocamlpro/ocaml

RUN opam switch create refinedc-projects ocaml-variants.4.14.0+options ocaml-option-flambda

RUN opam repo add coq-released "https://coq.inria.fr/opam/released" && \
    opam repo add iris-dev "https://gitlab.mpi-sws.org/iris/opam.git" && \
    opam update && \
    opam pin add -n -y cerberus-lib "git+https://github.com/rems-project/cerberus.git#57c0e80af140651aad72e3514133229425aeb102" && \
    opam pin add -n -y cerberus "git+https://github.com/rems-project/cerberus.git#57c0e80af140651aad72e3514133229425aeb102" && \
    opam pin add refinedc "git+https://gitlab.mpi-sws.org/iris/refinedc.git"

WORKDIR /home/projects
