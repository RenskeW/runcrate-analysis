# Scenario 1

![Workflow Graph](./wf_graph.svg)

- Run the workflow: `cwltool wf.cwl wf_job.yml`
- Create workflow graph: `cwltool --print-dot wf.cwl | dot -Tsvg > wf_graph.svg`
- Create RO: `cwltool --full-name "Renske de Wit" --orcid https://orcid.org/0000-0003-0902-0086 --provenance ./ro wf.cwl wf_job.yml`
- Convert to ROCrate: `runcrate convert ./ro --output ./rocrate`

## Human agent

Both name and ORCID ID are included in `ro-crate-metadata.json`.

## `label`

None of the `label` fields are propagated to `ro-crate-metadata.json`, but they are included in `packed.cwl`.

## `doc`

Only [CommandLineTool "doc" field](https://github.com/RenskeW/runcrate-analysis/blob/774a2b3c6f00ebe5c68244fa39a660b45618ca25/scenario1/rocrate/ro-crate-metadata.json#L132) is included in `ro-crate-metadata.json`. The others are only included in `packed.cwl`.

## `format`

Propagated:

- [CommandInputParameter](https://github.com/RenskeW/runcrate-analysis/blob/774a2b3c6f00ebe5c68244fa39a660b45618ca25/scenario1/rocrate/ro-crate-metadata.json#L149)
- [CommandOutputParameter](https://github.com/RenskeW/runcrate-analysis/blob/774a2b3c6f00ebe5c68244fa39a660b45618ca25/scenario1/rocrate/ro-crate-metadata.json#L156)
- [WorkflowInputParameter](https://github.com/RenskeW/runcrate-analysis/blob/774a2b3c6f00ebe5c68244fa39a660b45618ca25/scenario1/rocrate/ro-crate-metadata.json#L106)
- [WorkflowOutputParameter](https://github.com/RenskeW/runcrate-analysis/blob/774a2b3c6f00ebe5c68244fa39a660b45618ca25/scenario1/rocrate/ro-crate-metadata.json#L110)

Not propagated:

- [WorkflowInputParameter value](https://github.com/RenskeW/runcrate-analysis/blob/774a2b3c6f00ebe5c68244fa39a660b45618ca25/scenario1/ro/workflow/primary-job.json#L5)

## `intent`

None of the `intent` fields ([Workflow](https://github.com/RenskeW/runcrate-analysis/blob/774a2b3c6f00ebe5c68244fa39a660b45618ca25/scenario1/rocrate/packed.cwl#L43) and [CommandLineTool](https://github.com/RenskeW/runcrate-analysis/blob/774a2b3c6f00ebe5c68244fa39a660b45618ca25/scenario1/rocrate/packed.cwl#L9)) are propated to `ro-crate-metadata.json`, but they are part of `packed.cwl`.

