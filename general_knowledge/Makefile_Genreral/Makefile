.PHONY: rule1 rule2 rule3


all:
	gcc -o exam hello.c main.c -I .
clean:
	rm -rf exam 
var := "var"
var3 := "var3"
include abcd.mk

var1 = $(var)
var2 := $(var)
var3 ?= $(var)

var := "changed"


rule3:
	@echo "$(var1)"
	@echo "$(var2)"
	@echo "$(var3)"

rule1:
	echo "hi im rule 1"
rule2:	
	@echo "hi im rule 2"

