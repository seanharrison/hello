(declare-project
  :name "hello")

(declare-source
  :source ["hello.janet"])

(declare-executable
 :name "hello"
 :entry "hello.janet")