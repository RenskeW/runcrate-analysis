#!/usr/bin/env cwl-runner

cwlVersion: v1.2
baseCommand: echo
class: CommandLineTool

stdout: output.md

label: "CLT_label"
doc: "CLT_doc"
intent: [ http://edamontology.org/operation_0004 ]

arguments:
- $(inputs.clt_input_file.path)

inputs:
  clt_input_file:
    type: File
    label: "CLT_input_param_label"
    doc: "CLT_input_param_doc"
    format: https://www.iana.org/assignments/media-types/text/tab-separated-values

outputs: 
  clt_output_file:
    type: File
    outputBinding:
      glob: output.md
    label: "CLT_output_param_label"
    doc: "CLT_output_param_doc"
    format: https://www.iana.org/assignments/media-types/text/markdown
