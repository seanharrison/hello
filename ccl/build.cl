(load #P"hello.cl")
(save-application #P"hello" :toplevel-function #'hello :prepend-kernel t)
