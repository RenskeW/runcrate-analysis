#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool 
hints:
  DockerRequirement:
    dockerPull: amancevice/pandas:1.3.4-slim # Script needs numpy which is a dependency of pandas

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