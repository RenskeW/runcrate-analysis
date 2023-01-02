#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: Workflow

label: "WF_label"
doc: "WF_doc"
intent: [ http://edamontology.org/operation_0004 ]

inputs:
  wf_input_file: 
    type: File
    label: "wf_input_param_label"
    doc: "wf_input_param_doc"
    format: https://www.iana.org/assignments/media-types/text/tab-separated-values

outputs: 
  wf_output_file:
    type: File
    outputSource: wf_step/clt_output_file
    label: "wf_output_param_label"
    doc: "wf_output_param_doc"
    format: https://www.iana.org/assignments/media-types/text/markdown

steps:
  wf_step:
    in: 
      clt_input_file: wf_input_file
    out: [ clt_output_file ]
    run: ./echo_file_path.cwl
    label: "wf_step_label"
    doc: "wf_step_doc"
