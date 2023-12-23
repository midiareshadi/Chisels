## Chisel basic examples
The purpose of this repository is to create straightforward and practical examples for learning Chisel. Consequently, I have made an effort to incorporate RTL (Register-Transfer Level) concepts into these examples.

### Compiling examples
To execute all examples, utilize the `sbt` command:

`sbt run`

However, if you wish to run examples independently, employ the `make` command. For instance, to execute the D flip-flop example, use:

`make dff.run` 

For running the test bench and generating a VCD file, employ the following command, specifically for the D flip-flop example:

`make dff.test`
