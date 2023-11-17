#!/usr/bin/env cwl-runner

class: Workflow
cwlVersion: v1.2

inputs:
  wf_input_fasta:
    type: File
    default:
      class: File
      location: ./test.fasta

outputs:
  wf_output_dir:
    type: Directory
    outputSource: step1/pc7_features

steps:
  step1:
    in: 
      fasta: wf_input_fasta
      outdir: { default: "output_directory_name" }
    out: [ pc7_features ]
    run: ./clt.cwl

