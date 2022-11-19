## Example of MPI job in Nextflow

MPI jobs utilize [mpioperator](https://github.com/kubeflow/mpi-operator). Version 0.3.0 or later is required.

You find example of container in `container` directory.

Running command: `nextflow kuberun CERIT-SC/nf-pi-mpi -head-image 'cerit.io/nextflow/nextflow:22.11.0-SNAPSHOT-mpi' -head-memory 4096Mi -head-cpus 1 -v test-home:/mnt -r main`

### Example output
```
Job started: chaotic-heyrovsky
N E X T F L O W  ~  version 22.11.0-SNAPSHOT
Launching `https://github.com/CERIT-SC/nf-pi-mpi` [chaotic-heyrovsky] DSL2 - revision: 9bd4236c94 [main]
[51/2c0584] Submitted process > computePI (2)
[7f/d14cea] Submitted process > computePI (1)
[f5/f02bf3] Submitted process > computePI (3)
[84/307696] Submitted process > computePI (4)
Host nf-512c0584d2a36aefd99a906dc3b38996-worker-0, workers: 3, pi is approximately 3.1409550666666668

Host nf-7fd14cea5a8e07c6272e7fda1171d66e-worker-0, workers: 2, pi is approximately 3.1410376000000002

Host nf-f5f02bf396ea322eebf8afd8978cdcfe-worker-0, workers: 4, pi is approximately 3.1412433000000002

Host nf-84307696cd7aa1833b8df017c6c61d9b-worker-0, workers: 5, pi is approximately 3.1411945599999997

```

After failed run, check existence of `MPIJob` kind and delete remaining instances.
