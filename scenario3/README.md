# Scenario 3

The same workflow as in Scenario 2B, but now with `DockerRequirement` instead of `SoftwareRequirement.

- Create workflow graph: `cwltool --print-dot wf.cwl | dot -Tsvg > wf_graph.svg`
- Create CWLProv RO: `cwltool --provenance ./ro wf.cwl`
- Convert to ROCrate: `runcrate convert ./ro --output ./rocrate`

The Docker image is represented in CWLProv provenance graph. 

The Docker image is not represented in `ro-crate-metadata.json`. 

# Commit [7c77b0dabe45e60a2cb87d8320a5c1df592fb477](https://github.com/ResearchObject/runcrate/commit/4e69222e9489da5fe4f16d94a97a2242e2b3009d)

Rerun conversion step: `runcrate convert ./ro --output ./rocrate_v2`

