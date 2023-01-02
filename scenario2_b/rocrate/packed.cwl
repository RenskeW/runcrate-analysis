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
                    "default": "output_directory_name",
                    "id": "#clt.cwl/outdir"
                },
                {
                    "type": "File",
                    "inputBinding": {
                        "position": 1
                    },
                    "default": {
                        "class": "File",
                        "location": "file:///Users/renskedewit/Documents/GitHub/runcrate-analysis/scenario2_b/get_pc7_inputs.py"
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
                        "location": "file:///Users/renskedewit/Documents/GitHub/runcrate-analysis/scenario2_b/test.fasta"
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