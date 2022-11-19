## Example of MPI job in Nextflow

MPI jobs utilize [mpioperator](https://github.com/kubeflow/mpi-operator). Version 0.3.0 or later is required.

You find example of container in `container` directory.

Running command: `nextflow kuberun CERIT-SC/nf-pi-mpi -head-image 'cerit.io/nextflow/nextflow:22.11.0-SNAPSHOT-mpi' -head-memory 4096Mi -head-cpus 1 -v test-home:/mnt -r main`

After failed run, check existence of `MPIJob` kind and delete remaining instances.
