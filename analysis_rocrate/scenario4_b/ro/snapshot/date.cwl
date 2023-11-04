#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: CommandLineTool
baseCommand: [date, "-r"]

requirements:
  ResourceRequirement:
    ramMin: 500
    coresMin: 1

inputs:
  file: 
    type: File
    inputBinding:
      position: 1

outputs: []



