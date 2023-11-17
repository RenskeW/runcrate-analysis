{
    "$graph": [
        {
            "class": "CommandLineTool",
            "hints": [
                {
                    "class": "LoadListingRequirement",
                    "loadListing": "deep_listing"
                },
                {
                    "class": "NetworkAccess",
                    "networkAccess": true
                },
                {
                    "packages": [
                        {
                            "specs": [
                                "https://anaconda.org/conda-forge/numpy"
                            ],
                            "version": [
                                "1.21.4"
                            ],
                            "package": "numpy"
                        }
                    ],
                    "class": "SoftwareRequirement"
                }
            ],
            "baseCommand": "python3",
            "inputs": [
                {
                    "type": "File",
                    "inputBinding": {
                        "position": 2
                    },
                    "id": "#clt.cwl/fasta"
                },
                {
                    "type": "string",
                    "inputBinding": {
                        "position": 3,
                        "prefix": "-o"
                    },
                    "id": "#clt.cwl/outdir"
                },
                {
                    "type": "File",
                    "inputBinding": {
                        "position": 1
                    },
                    "default": {
                        "class": "File",
                        "location": "file:///Users/renskedewit/Documents/GitHub/runcrate-analysis/scenario2/get_pc7_inputs.py"
                    },
                    "id": "#clt.cwl/script"
                }
            ],
            "id": "#clt.cwl",
            "outputs": [
                {
                    "type": "Directory",
                    "outputBinding": {
                        "glob": "$(inputs.outdir)"
                    },
                    "id": "#clt.cwl/pc7_features"
                }
            ]
        },
        {
            "class": "Workflow",
            "inputs": [
                {
                    "type": "File",
                    "default": {
                        "class": "File",
                        "location": "file:///Users/renskedewit/Documents/GitHub/runcrate-analysis/scenario2/test.fasta"
                    },
                    "id": "#main/wf_input_fasta"
                }
            ],
            "outputs": [
                {
                    "type": "Directory",
                    "outputSource": "#main/step1/pc7_features",
                    "id": "#main/wf_output_dir"
                }
            ],
            "steps": [
                {
                    "in": [
                        {
                            "source": "#main/wf_input_fasta",
                            "id": "#main/step1/fasta"
                        },
                        {
                            "default": "output_directory_name",
                            "id": "#main/step1/outdir"
                        }
                    ],
                    "out": [
                        "#main/step1/pc7_features"
                    ],
                    "run": "#clt.cwl",
                    "id": "#main/step1"
                }
            ],
            "id": "#main"
        }
    ],
    "cwlVersion": "v1.2"
}