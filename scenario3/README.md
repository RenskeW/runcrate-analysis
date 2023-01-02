# Scenario 3

The same workflow as in Scenario 2B, but now with `DockerRequirement` instead of `SoftwareRequirement.

- Create workflow graph: `cwltool --print-dot wf.cwl | dot -Tsvg > wf_graph.svg`
- Create CWLProv RO: `cwltool --provenance ./ro wf.cwl`
- Convert to ROCrate: `runcrate convert ./ro --output ./rocrate`

The Docker image is represented in CWLProv provenance graph. 

The Docker image is not represented in `ro-crate-metadata.json`. 