{
    "$graph": [
        {
            "class": "CommandLineTool",
            "baseCommand": [
                "date",
                "-r"
            ],
            "requirements": [
                {
                    "ramMin": 500,
                    "coresMin": 1,
                    "class": "ResourceRequirement"
                }
            ],
            "inputs": [
                {
                    "type": "File",
                    "inputBinding": {
                        "position": 1
                    },
                    "id": "#date.cwl/file"
                }
            ],
            "id": "#date.cwl",
            "outputs": []
        },
        {
            "class": "CommandLineTool",
            "baseCommand": "echo",
            "arguments": [
                "$(inputs.input_file.path)",
                "$(inputs.input_dir.path)"
            ],
            "inputs": [
                {
                    "type": "Directory",
                    "id": "#echo.cwl/input_dir"
                },
                {
                    "type": "File",
                    "id": "#echo.cwl/input_file"
                }
            ],
            "outputs": [],
            "id": "#echo.cwl"
        },
        {
            "class": "Workflow",
            "requirements": [
                {
                    "class": "ScatterFeatureRequirement"
                }
            ],
            "inputs": [
                {
                    "type": {
                        "type": "array",
                        "items": "File"
                    },
                    "id": "#main/wf_input_array"
                },
                {
                    "type": "Directory",
                    "id": "#main/wf_input_dir"
                },
                {
                    "type": "File",
                    "id": "#main/wf_input_file"
                },
                {
                    "type": "string",
                    "id": "#main/wf_input_string"
                }
            ],
            "outputs": [],
            "steps": [
                {
                    "scatter": "#main/date2_step/file",
                    "in": [
                        {
                            "source": "#main/wf_input_array",
                            "id": "#main/date2_step/file"
                        }
                    ],
                    "out": [],
                    "run": "#date.cwl",
                    "id": "#main/date2_step"
                },
                {
                    "in": [
                        {
                            "source": "#main/wf_input_file",
                            "id": "#main/date_step/file"
                        }
                    ],
                    "out": [],
                    "run": "#date.cwl",
                    "id": "#main/date_step"
                },
                {
                    "run": {
                        "class": "CommandLineTool",
                        "cwlVersion": "v1.2",
                        "baseCommand": "echo",
                        "inputs": [
                            {
                                "type": "string",
                                "id": "#main/echo2_step/run/clt_str_input"
                            }
                        ],
                        "outputs": [],
                        "arguments": [
                            "$(inputs.clt_str_input)"
                        ]
                    },
                    "in": [
                        {
                            "source": "#main/wf_input_string",
                            "id": "#main/echo2_step/clt_str_input"
                        }
                    ],
                    "out": [],
                    "id": "#main/echo2_step"
                },
                {
                    "in": [
                        {
                            "source": "#main/wf_input_dir",
                            "id": "#main/echo_step/input_dir"
                        },
                        {
                            "source": "#main/wf_input_file",
                            "id": "#main/echo_step/input_file"
                        }
                    ],
                    "out": [],
                    "run": "#echo.cwl",
                    "id": "#main/echo_step"
                }
            ],
            "id": "#main"
        }
    ],
    "cwlVersion": "v1.2"
}