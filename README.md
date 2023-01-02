# runcrate-analysis

This repository documents the analysis of Workflow Run RO-Crate objects converted from CWL ROs using [runcrate](https://github.com/ResearchObject/runcrate). 

Here I perform the same analysis as for CWL ROs, described [here](https://doi.org/10.5281/zenodo.7014948). 

## Scenario 1: Analyze representation of CWL metadata fields and human agent

RO of workflow with metadata fields for the following workflow elements:

- `label`: Workflow, WorkflowInputParameter, WorkflowOutputParameter, CommandLineTool, CommandInputParameter, CommandOutputParameter, WorkflowStep
- `doc`: Workflow, WorkflowInputParameter, WorkflowOutputParameter, CommandLineTool, CommandInputParameter, CommandOutputParameter, WorkflowStep
- `intent`: Workflow, CommandLineTool
- `format`: WorkflowInputParameter, WorkflowOutputParameter, CommandInputParameter, CommandOutputParameter, WorkflowInputParameter value (File)

Workflow executed with full name and ORCID of human agent.

Results:

- Human agent: represented with name and ORCID in RDF
- Metadata annotations: ?