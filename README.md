# Analysis of runcrate 0.5.0

This repository documents the analysis of Workflow Run RO-Crates (WRROC) converted from CWLProv RO Bundles using [runcrate](https://github.com/ResearchObject/runcrate). The results of this analysis are also published on Zenodo: <https://doi.org/10.5281/zenodo.12689424>. 

The analysis follows the same methodology as [previous work](https://doi.org/10.5281/zenodo.7014950), in which we conducted a qualitative evaluation of metadata coverage in CWLProv (version 0.6.0). This earlier analysis was based on concrete examples of ROs associated with a realistic bioinformatics workflow. Here, we repeated the analysis for Workflow Run RO-Crate, and compared the WRROC RDF representation (in `ro-crate-metadata.json`) with the CWLProv RDF provenance graph. 

## Methods

We used the following approach and documented it in the [Issues](https://github.com/RenskeW/runcrate-analysis/issues):

1. Provenance metadata was classified into 6 categories: T1-6.
2. For each category, we made an inventory of metadata that is contained in CWLProv RO Bundles (in RDF, and structured, non-RDF documents (`packed.cwl`, and `primary-job.json`/`primary-output.json`)).
3. Subsequently, we assessed if and how this information is represented in Workflow Run RO-Crates converted by runcrate, based on a number of examples (see below).
4. Finally, we provided suggestions how to represent metadata that is present in CWLProv but missing in RO-Crate.

### Scenario 1: Analyze representation of CWL metadata fields, human agent, file characteristics, execution details

[Read more...](./scenario1/README.md)

### Scenario 2: Analyze representation of `SoftwareRequirement`

[Read more...](./scenario2/README.md)

### Scenario 3: Analyze representation of `DockerRequirement`

[Read more...](./scenario3/README.md)

### Scenario 4: Analyze representation of `String`, `File`, `Directory` and `File array` input parameters AND `ResourceRequirement`

[Read more...](./scenario4/README.md)

## Results

Overview of the representation of each category of the provenance taxonomy, and its representation in RO-Crate. For a detailed explanation of each of the categories, see here: <https://doi.org/10.5281/zenodo.7014950>.

### SC1: Workflow design
Explanation of the design of the workflow and its steps can be included in the CWL metadata fields (`doc`, `label`, `intent`).

- **CWL (non-RDF)**: full representation
- **`ro-crate-metadata.json` (RDF)**: full representation
- **CWLProv RDF**: no representation

### SC2: Entity annotations
Explanation of the meaning of individual input/output data entities can be represented as structured annotations in the CWL input parameter file (not propagated to `ro-crate-metadata.json`), but there is in the CWL standards v1.2 no clear guideline how to do these annotations.

- **CWL (non-RDF)**: partial representation (structured annotations but no CWL metadata fields)
- **`ro-crate-metadata.json` (RDF)**: no representation
- **CWLProv RDF**: no representation

### SC3: Workflow execution annotations
Workflow execution annotations (why was this combination of input parameters chosen?) can be represented as annotations in the CWL input parameter file (unstructured, not propagated to `ro-crate-metadata.json`).

- **CWL (non-RDF)**: unstructured representation
- **`ro-crate-metadata.json` (RDF)**: no representation
- **CWLProv RDF**: no representation

### D1: Data identification
This information can be added in the CWL input parameter file as structured annotations, but there is in the CWL standards v1.2 no clear guideline how to do these annotations. I

- **CWL (non-RDF)**: partial representation
- **`ro-crate-metadata.json` (RDF)**: no representation
- **CWLProv RDF**: no representation

### D2: File characteristics
Filename, checksum are represented for all files, creation timestamps are available for output files. Additional structured annotations may be made in the CWL input parameter file. Filename and checksum are propagated to `ro-crate-metadata.json`.

- **CWL (non-RDF)**: partial representation
- **`ro-crate-metadata.json` (RDF)**: partial representation
- **CWLProv RDF**: partial representation

### D3: Data access
The CWL standards v1.2 allow specification of a remote location for data, which would serve as access to a downloadable form of the data.

- **CWL (non-RDF)**: partial representation
- **`ro-crate-metadata.json` (RDF)**: no representation
- **CWLProv RDF**: no representation

### D4: Parameter mapping
Mapping of input/output data to workflow parameters is represented in `ro-crate-metadata.json`.

- **CWL (non-RDF)**: full representation
- **`ro-crate-metadata.json` (RDF)**: full representation
- **CWLProv RDF**: full representation

### SW1: Software identification

`SoftwareRequirement` field is propagated to `ro-crate-metadata.json`. `SoftwareRequirement` contains `specs` field with IRI, resolving to landing page with metadata about the tool (see [CWL standards v1.2](https://www.commonwl.org/v1.2/CommandLineTool.html#SoftwarePackage)). 

- **CWL (non-RDF)**: full representation
- **`ro-crate-metadata.json` (RDF)**: full representation
- **CWLProv RDF**: no representation

### SW2: Software documentation

`SoftwareRequirement` field is propagated to `ro-crate-metadata.json`.

- **CWL (non-RDF)**: full representation
- **`ro-crate-metadata.json` (RDF)**: full representation
- **CWLProv RDF**: no representation

### SW3: Software access

`SoftwareRequirement` field is propagated to `ro-crate-metadata.json`.

- **CWL (non-RDF)**: full representation
- **`ro-crate-metadata.json` (RDF)**: full representation
- **CWLProv RDF**: no representation

### WF1: Workflow software

The workflow itself (`packed.cwl`) is contained in the CWLProv RO Bundle, as well as the RO-Crate produced by runcrate. Metadata/documentation about the workflow can be represented in CWL metadata fields (`doc`, `label`, `intent`), which are propagated to `ro-crate-metadata.json`. `ro-crate-metadata.json` also contains a description of the workflow and all its parameters and steps. The representation of the workflow in CWLProv RDF is incomplete.

- **CWL (non-RDF)**: full representation
- **`ro-crate-metadata.json` (RDF)**: full representation
- **CWLProv RDF**: partial representation

### WF2: Workflow parameters
Information about the workflow parameters can be represented in the CWL metadata fields (`doc`, `label`, `format`).

- **CWL (non-RDF)**: full representation
- **`ro-crate-metadata.json` (RDF)**: full representation
- **CWLProv RDF**: no representation

### WF3: Workflow requirements

The CWL `ResourceRequirement` field is partially propagated to `ro-crate-metadata.json` (Scenario 4).

- **CWL (non-RDF)**: full representation
- **`ro-crate-metadata.json` (RDF)**: partial representation
- **CWLProv RDF**: no representation

### ENV1: Software environment
Absent.

### ENV2: Hardware environment
Absent.

### ENV3: Container image
Container image is partially represented in CWL `DockerRequirement` field, which is propagated to `ro-crate-metadata.json` (Scenario 3).

- **CWL (non-RDF)**: partial representation
- **`ro-crate-metadata.json` (RDF)**: partial representation
- **CWLProv RDF**: no representation

### EX1: Execution timestamps

- **CWL (non-RDF)**: no representation
- **`ro-crate-metadata.json` (RDF)**: full representation
- **CWLProv RDF**: full representation

### EX2: Consumed resources
Absent.

### EX3: Workflow engine

- **CWL (non-RDF)**: no representation
- **`ro-crate-metadata.json` (RDF)**: partial representation
- **CWLProv RDF**: partial representation (only name and version, no IRI resolving to landing page with metadata)

### EX4: Human agent

- **CWL (non-RDF)**: no representation
- **`ro-crate-metadata.json` (RDF)**: full representation
- **CWLProv RDF**: full representation





