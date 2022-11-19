## Example of MPI job in Nextflow

You find example of container in `container` directory.

Running command: `nextflow kuberun CERIT-SC/nf-pi-mpi -head-image 'cerit.io/nextflow/nextflow:22.11.0-SNAPSHOT-mpi' -head-memory 4096Mi -head-cpus 1 -v test-home:/mnt -r main`

After failed run, check existence of `MPIJob` kind and delete remaining instances.
