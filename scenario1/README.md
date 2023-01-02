# Scenario 1

![Workflow Graph](./wf_graph.svg)

- Run the workflow: `cwltool wf.cwl wf_job.yml`
- Create workflow graph: `cwltool --print-dot wf.cwl | dot -Tsvg > wf_graph.svg`
- Create RO: `cwltool --full-name "Renske de Wit" --orcid https://orcid.org/0000-0003-0902-0086 --provenance ./ro wf.cwl wf_job.yml`
- Convert to ROCrate: `runcrate convert ./ro --output ./rocrate`

## Human agent

Both name and ORCID ID are included in `ro-crate-metadata.json`.

## `label`

Propagated: ?

Not propagated: ?

## `doc`

Propagated: ?

Not propagated: ?

## `format`

?

## `intent`

?





