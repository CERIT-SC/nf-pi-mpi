#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process computePI {
  input: 
    val x
  output:
    stdout
  script:
    """
    sleep 10; mpirun -n $x /home/user/pi 
    """
}

workflow {
  Channel.of('2', '3', '4', '5') | computePI | view
}
