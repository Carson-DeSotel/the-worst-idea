JUNK= *.class *.txt *.out *.o number-generator

clean :
	@rm -f $(JUNK)

all :
	@gcc -o number-generator number-generator.c 
	@javac number-generator.java 