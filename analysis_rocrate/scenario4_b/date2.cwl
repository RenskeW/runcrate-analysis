#!/usr/bin/env cwl-runner

class: CommandLineTool
cwlVersion: v1.2
baseCommand: echo

inputs:
  clt_str_input: string

outputs: []

arguments:
- $(inputs.clt_str_input)