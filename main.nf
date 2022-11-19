#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {
  input: 
    val x
  output:
    stdout
  script:
    """
    mpirun -n 2 /home/user/pi $x
    """
}

workflow {
  Channel.of('1', '2', '3', '3') | sayHello | view
}