# Run commands:
# D flip flop run
dff.run:
	sbt "runMain DFlipFlop"
	
# Full Adder run
fa.run:
	sbt "runMain FullAdder"	

#--------------------------

# Test commands:
# D flip flop test
dff.test:
	sbt "testOnly D_FlipFlopTests"
	
# Full Adder run
fa.test:
	sbt "testOnly FullAdderTests"

#--------------------------

# make clean
clean:
	git clean -fd

