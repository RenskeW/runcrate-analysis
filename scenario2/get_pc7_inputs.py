"""
Definition:
Generation of PC7 input features.

Inputs: 
- *.fasta: file containing fasta sequences in ??? format
- name of output directory to store script output. Will be created if it doesn't exist already.


Outputs: 
- *.input files for every sequence in the .fasta file.

"""

import argparse
import os
#import sys
import numpy as np

def parse_args():
    """
    Parses arguments from the command line.
    """

    parser = argparse.ArgumentParser(description='Generates PC7 features for every sequence in .fasta file.')
    
    # Arguments
    parser.add_argument('fasta', help='Path to .fasta file containing fasta sequences.')
    parser.add_argument('-o', dest='out_path', help='Path to output directory. This argument is required!', required=True)

    return parser.parse_args()

def read_fasta(fasta_path):
    """
    Reads fasta file, returns list of lists [[pdb_id1.pdb, seq1], [pdb_id2.pdb, seq2], ... ]
    This function was copied from OPUS-TASS repository: https://github.com/thuxugang/opus_tass/blob/master/inference_utils.py
    """
    files = []

    f = open(fasta_path, 'r')
    tmp = []
    for i in f.readlines():
        line = i.strip()
        if line[0] == '>': # This function can't handle empty lines
            tmp.append(line[1:])
        else:
            tmp.append(line)
            files.append(tmp)
            tmp = []
    f.close()      
    return files

def get_pc7_dict():
    """
    This function was copied from OPUS-TASS Github repo https://github.com/thuxugang/opus_tass/blob/master/inference_utils.py
    """   
    resname_to_pc7_dict = {'A': [-0.350, -0.680, -0.677, -0.171, -0.170, 0.900, -0.476],
                'C': [-0.140, -0.329, -0.359, 0.508, -0.114, -0.652, 0.476],
                'D': [-0.213, -0.417, -0.281, -0.767, -0.900, -0.155, -0.635],
                'E': [-0.230, -0.241, -0.058, -0.696, -0.868, 0.900, -0.582],
                'F': [ 0.363, 0.373, 0.412, 0.646, -0.272, 0.155, 0.318],
                'G': [-0.900, -0.900, -0.900, -0.342, -0.179, -0.900, -0.900],
                'H': [ 0.384, 0.110, 0.138, -0.271, 0.195, -0.031, -0.106],
                'I': [ 0.900, -0.066, -0.009, 0.652, -0.186, 0.155, 0.688],
                'K': [-0.088, 0.066, 0.163, -0.889, 0.727, 0.279, -0.265],
                'L': [ 0.213, -0.066, -0.009, 0.596, -0.186, 0.714, -0.053],
                'M': [ 0.110, 0.066, 0.087, 0.337, -0.262, 0.652, -0.001],
                'N': [-0.213, -0.329, -0.243, -0.674, -0.075, -0.403, -0.529],
                'P': [ 0.247, -0.900, -0.294, 0.055, -0.010, -0.900, 0.106],
                'Q': [-0.230, -0.110, -0.020, -0.464, -0.276, 0.528, -0.371],
                'R': [ 0.105, 0.373, 0.466, -0.900, 0.900, 0.528, -0.371],
                'S': [-0.337, -0.637, -0.544, -0.364, -0.265, -0.466, -0.212],
                'T': [ 0.402, -0.417, -0.321, -0.199, -0.288, -0.403, 0.212],
                'V': [ 0.677, -0.285, -0.232, 0.331, -0.191, -0.031, 0.900],
                'W': [ 0.479, 0.900, 0.900, 0.900, -0.209, 0.279, 0.529],
                'Y': [ 0.363, 0.417, 0.541, 0.188, -0.274, -0.155, 0.476]}
    return resname_to_pc7_dict

def make_pc7(file, resname_to_pc7_dict):
    """
    This function was adapted from make_input() from OPUS-TASS Github repo https://github.com/thuxugang/opus_tass/blob/master/inference_utils.py
    7pc
    """    
    filename = file[0].split('.')[0] # PDB ID
    fasta = file[1] # fasta sequence  
    
    seq_len = len(fasta)
    
    pc7 = np.zeros((seq_len, 7))
    for i in range(seq_len):
        pc7[i] = resname_to_pc7_dict[fasta[i]]
 
    assert pc7.shape == (seq_len,7)
    return pc7, filename
    

def main():
    args = parse_args() 
    fasta_path = args.fasta
    out_path = args.out_path

    files = read_fasta(fasta_path) 

    # Create directory to store output files
    if not os.path.exists(out_path):
        os.mkdir(out_path)
        print(f"Created new directory {out_path} to store PC7 input features.")
    else:
        print(f"Using existing directory {out_path} to store PC7 input features.")

    # Create PC7 dictionary
    resname_to_pc7_dict = get_pc7_dict()

    # Loop through sequences, assign pc7 features to each residue in each sequence.
    for file in files:
        pc7, filename = make_pc7(file, resname_to_pc7_dict)
        
        # Save PC7 features for this sequence
        pc7_path = f"{out_path}/pc7_{filename}.input"

        np.savetxt(pc7_path, pc7, fmt="%.4f")
        
    print(f"Saved PC7 input features for all sequences in {fasta_path} in {out_path}.")
    
    
if __name__ == "__main__":
    main()


    