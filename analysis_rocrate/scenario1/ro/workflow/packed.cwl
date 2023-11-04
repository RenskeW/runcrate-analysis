{
    "$graph": [
        {
            "baseCommand": "echo",
            "class": "CommandLineTool",
            "stdout": "output.md",
            "label": "CLT_label",
            "doc": "CLT_doc",
            "intent": [
                "http://edamontology.org/operation_0004"
            ],
            "arguments": [
                "$(inputs.clt_input_file.path)"
            ],
            "inputs": [
                {
                    "type": "File",
                    "label": "CLT_input_param_label",
                    "doc": "CLT_input_param_doc",
                    "format": "https://www.iana.org/assignments/media-types/text/tab-separated-values",
                    "id": "#echo_file_path.cwl/clt_input_file"
                }
            ],
            "id": "#echo_file_path.cwl",
            "outputs": [
                {
                    "type": "File",
                    "outputBinding": {
                        "glob": "output.md"
                    },
                    "label": "CLT_output_param_label",
                    "doc": "CLT_output_param_doc",
                    "format": "https://www.iana.org/assignments/media-types/text/markdown",
                    "id": "#echo_file_path.cwl/clt_output_file"
                }
            ]
        },
        {
            "class": "Workflow",
            "label": "WF_label",
            "doc": "WF_doc",
            "intent": [
                "http://edamontology.org/operation_0004"
            ],
            "inputs": [
                {
                    "type": "File",
                    "label": "wf_input_param_label",
                    "doc": "wf_input_param_doc",
                    "format": "https://www.iana.org/assignments/media-types/text/tab-separated-values",
                    "id": "#main/wf_input_file"
                }
            ],
            "outputs": [
                {
                    "type": "File",
                    "outputSource": "#main/wf_step/clt_output_file",
                    "label": "wf_output_param_label",
                    "doc": "wf_output_param_doc",
                    "format": "https://www.iana.org/assignments/media-types/text/markdown",
                    "id": "#main/wf_output_file"
                }
            ],
            "steps": [
                {
                    "in": [
                        {
                            "source": "#main/wf_input_file",
                            "id": "#main/wf_step/clt_input_file"
                        }
                    ],
                    "out": [
                        "#main/wf_step/clt_output_file"
                    ],
                    "run": "#echo_file_path.cwl",
                    "label": "wf_step_label",
                    "doc": "wf_step_doc",
                    "id": "#main/wf_step"
                }
            ],
            "id": "#main"
        }
    ],
    "cwlVersion": "v1.2"
}