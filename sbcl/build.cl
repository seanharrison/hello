(load #P"hello.cl")
(sb-ext:save-lisp-and-die "hello" :toplevel #'hello :executable t :compression 22)
