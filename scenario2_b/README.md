# Scenario 2b

![Workflow graph](./wf_graph.svg)

Single-step workflow. CommandLineTool has 3 parameters:

1. `fasta`: default value defined at WorkflowInputParameter level
2. `script`: default value defined at CommandLineTool input parameter level
3. `outdir`: default value defined at **CommandLineTool input parameter level** (in contrast to Scenario2A).

Output: `./output_directory_name`

- Create CWLProv RO: `cwltool --provenance ./ro wf.cwl`
- Create workflow graph: `cwltool --print-dot wf.cwl | dot -Tsvg > wf_graph.svg`
- Convert to ROCrate: `runcrate convert ./ro --output ./rocrate`


# Commit [7c77b0dabe45e60a2cb87d8320a5c1df592fb477](https://github.com/ResearchObject/runcrate/commit/4e69222e9489da5fe4f16d94a97a2242e2b3009d)

Rerun conversion step: `runcrate convert ./ro --output ./rocrate_v2`

