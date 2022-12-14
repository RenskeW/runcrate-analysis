# runcrate-analysis

This repository documents the analysis of Workflow Run RO-Crates converted from CWLProv RO Bundles using [runcrate](https://github.com/ResearchObject/runcrate). 

Here I perform the same analysis that was done originally using CWLProv RO Bundles, described in <https://doi.org/10.5281/zenodo.7014948>. 

I used the following approach and documented it in the [Issues](https://github.com/RenskeW/runcrate-analysis/issues):

1. Provenance metadata was classified into 6 categories: T1-6.
2. For each category, I made an inventory of metadata that is contained in CWLProv RO Bundles (in RDF, `packed.cwl`, and `primary-job.json`/`primary-output.json`).
3. Subsequently, I assessed if and how this information is represented in Workflow Run RO-Crates converted by runcrate, based on a number of examples (see below).
4. Finally, I provided suggestions how to represent metadata that is present in CWLProv but missing in RO-Crate.

## Scenario 1: Analyze representation of CWL metadata fields, human agent, file characteristics, execution details

Commit [7c77b0dabe45e60a2cb87d8320a5c1df592fb477](https://github.com/ResearchObject/runcrate/commit/7c77b0dabe45e60a2cb87d8320a5c1df592fb477). 

RO of workflow with metadata fields for the following workflow elements:

- `label`: Workflow, WorkflowInputParameter, WorkflowOutputParameter, CommandLineTool, CommandInputParameter, CommandOutputParameter, WorkflowStep
- `doc`: Workflow, WorkflowInputParameter, WorkflowOutputParameter, CommandLineTool, CommandInputParameter, CommandOutputParameter, WorkflowStep
- `intent`: Workflow, CommandLineTool
- `format`: WorkflowInputParameter, WorkflowOutputParameter, CommandInputParameter, CommandOutputParameter, WorkflowInputParameter value (File)

Workflow executed with full name and ORCID of human agent.

Results:

- [Human agent](https://github.com/RenskeW/runcrate-analysis/blob/774a2b3c6f00ebe5c68244fa39a660b45618ca25/scenario1/rocrate/ro-crate-metadata.json#L203): represented with name and ORCID in RDF
- Metadata annotations: 
    - `doc`: Only `doc` field of `CommandLineTool` documents is included in `ro-crate-metadata.json`. 
    - `format`: Included for Workflow and CommandLineTool input/output parameters, but not for the actual files used as inputs or generated as outputs.
    - `intent`: Not included in `ro-crate-metadata.json`.
    - `label`: Not included in `ro-crate-metadata.json`.
- File characteristics:
    - basename: Not included in `ro-crate-metadata.json`. 
    - checksum: In CWLProv RO, file ID corresponds to the checksum of the file. In RO-Crate, ID is inherited from CWLProv RO, but not explicitly mentioned as checksum. 
    - creation/modification timestamps: Not included.
    - file size: Not included.
- Start/end timestamps of workflow execution: Represented in `ro-crate-metadata.json` at workflow and step level. 
- Workflow engine: Represented in `ro-crate-metadata.json` with name and version. 
- Workflow description:
    - Workflow: Linked to steps and to CommandLineTools executed in the steps. Programming language is specified. 
    - Parameters: An improvement compared to CWLProv, workflow and CommandLineTool parameters are described as independent entities (`FormalParameter`) in `ro-crate-metadata.json`. 

## Scenario 2: Analyze representation of `SoftwareRequirement`

Commit [7c77b0dabe45e60a2cb87d8320a5c1df592fb477](https://github.com/ResearchObject/runcrate/commit/7c77b0dabe45e60a2cb87d8320a5c1df592fb477). 

RO of workflow containing `SoftwareRequirement` in CommandLineTool description.

- Scenario 2A: Defining default values for WorkflowStepInputParameters gives an error.
- Scenario 2B: Instead of defining default value at WorkflowStep level, defined at CommandInputParameter level. 

Results of analysis of Scenario 2B:

- SoftwareRequirement is not part of `ro-crate-metadata.json`. 

## Scenario 3: Analyze representation of `DockerRequirement`

Commit [7c77b0dabe45e60a2cb87d8320a5c1df592fb477](https://github.com/ResearchObject/runcrate/commit/7c77b0dabe45e60a2cb87d8320a5c1df592fb477). 

RO of workflow containing `DockerRequirement` in CommandLineTool description.

Results of analysis: 

- In contrast to CWLProv RDF provenance graph, the name/tag of the container image is not included in `ro-crate-metadata.json`.

## Scenario 4: Analyze representation of `String`, `File`, `Directory` and `File array` input parameters AND `ResourceRequirement`

Commit [7c77b0dabe45e60a2cb87d8320a5c1df592fb477](https://github.com/ResearchObject/runcrate/commit/7c77b0dabe45e60a2cb87d8320a5c1df592fb477). 

RO of workflow containing 4 different types of inputs and with defined hardware requirements for one of the CommandLineTools.

- [scenario4_a](./scenario4_a): CWLProv RO cannot be converted by runcrate because one of the CommandLineTools is defined within the Workflow description.
- [scenario4_b](./scenario3_b): The same workflow, but here all CommandLineTools are defined in separate files.

Results of analysis of `scenario4_b`:

- ResourceRequirement: included in `packed.cwl`, but not in `ro-crate-metadata.json`.
- Representation of input parameter values:
    - All inputs are mapped to their input parameters via `exampleOfWork`.
    - File: Listed in `ro-crate-metadata.json` as `File`.
    - String: Listed in `ro-crate-metadata.json` as `Text`. 
    - Directory: Listed in `ro-crate-metadata.json` as `Dataset` and linked to the files it contains via `hasPart`.
    - File array: Listed in `ro-crate-metadata.json` as `File`, `multipleValues=TRUE` and linked to the files it contains via `values`.


