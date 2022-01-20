(compile-file #P"hello.cl" :system-p t)
(c:build-program "hello" :lisp-files '("hello.o"))
(si:exit)
