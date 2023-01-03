#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: Workflow

requirements:
  ScatterFeatureRequirement: {}

inputs:
  wf_input_file: File
  wf_input_dir: Directory
  wf_input_array: File[]
  wf_input_string: string

outputs: []

steps:
  date_step:
    in:
      file: wf_input_file
    out: []
    run: ./date.cwl
  echo_step:
    in:
      input_file: wf_input_file
      input_dir: wf_input_dir
    out: []
    run: ./echo.cwl
  date2_step:
    scatter: file
    in:
      file: wf_input_array
    out: []
    run: ./date.cwl
  echo2_step:
    run: ./date2.cwl
    in:
      clt_str_input: wf_input_string
    out: []




