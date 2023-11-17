# Analysis of runcrate 0.4.0

This repository documents the analysis of Workflow Run RO-Crates converted from CWLProv RO Bundles using [runcrate](https://github.com/ResearchObject/runcrate). 

Here we perform the same analysis that was done originally using CWLProv RO Bundles, described in <https://doi.org/10.5281/zenodo.7014948>. 

We used the following approach and documented it in the [Issues](https://github.com/RenskeW/runcrate-analysis/issues):

1. Provenance metadata was classified into 6 categories: T1-6.
2. For each category, we made an inventory of metadata that is contained in CWLProv RO Bundles (in RDF, `packed.cwl`, and `primary-job.json`/`primary-output.json`).
3. Subsequently, we assessed if and how this information is represented in Workflow Run RO-Crates converted by runcrate, based on a number of examples (see below).
4. Finally, we provided suggestions how to represent metadata that is present in CWLProv but missing in RO-Crate.

## Scenario 1: Analyze representation of CWL metadata fields, human agent, file characteristics, execution details

[Read more...](./scenario1/README.md)

## Scenario 2: Analyze representation of `SoftwareRequirement`

[Read more...](./scenario2/README.md)

## Scenario 3: Analyze representation of `DockerRequirement`

[Read more...](./scenario3/README.md)

## Scenario 4: Analyze representation of `String`, `File`, `Directory` and `File array` input parameters AND `ResourceRequirement`

[Read more...](./scenario4/README.md)



