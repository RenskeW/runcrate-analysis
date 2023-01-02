#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool 
hints:
  SoftwareRequirement:
    packages: 
      numpy:
        specs: [ https://anaconda.org/conda-forge/numpy ]
        version: [ "1.21.4" ]

baseCommand: python3
inputs:
  script:
    type: File
    inputBinding: {position: 1}
    default:
      class: File
      location: ./get_pc7_inputs.py
  fasta:
    type: File 
    inputBinding:
      position: 2
  outdir:
    type: string
    inputBinding: 
      position: 3
      prefix: -o
    default: "output_directory_name"

outputs: 
  pc7_features: 
    type: Directory 
    outputBinding:
      glob: $(inputs.outdir)