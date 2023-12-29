# Run commands:
# D flip flop run
dff.run:
	sbt "runMain DFlipFlop"
	
# Full Adder run
fa.run:
	sbt "runMain FullAdder"	

# 4 bit adder
adder4.run:
	sbt "runMain Adder4Bits"
	
# n bit adder
addern.run:
	sbt "runMain Adder3Bits"		

#--------------------------

# Test commands:
# D flip flop test
dff.test:
	sbt "testOnly D_FlipFlopTests"
	
# Full Adder run
fa.test:
	sbt "testOnly FullAdderTests"

# 4 bits Adder run
adder4.test:
	sbt "testOnly Adder4BitsTests"

# 4 bits Adder run
addern.test:
	sbt "testOnly AddernModuleTests"	

#--------------------------

# make clean
# clean:
# 	git clean -fd

