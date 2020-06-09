#!/bin/bash
#SBATCH --mail-user=kevin.mutemi@embl.de
#SBATCH --mail-type=ALL
#SBATCH --mem=30G
#SBATCH --time=48:00:00
#SBATCH -N 1

## load required modules
module load busco/3.0.1-foss-2016b-Python-2.7.12

## load config.ini.file
export BUSCO_CONFIG_FILE="/scratch/mutemi/BUSCO_Platy_seq/config/config.ini.platy"

## re-export the AUGUSTUS config path
export AUGUSTUS_CONFIG_PATH="/g/arendt/kevin/3.2.3-foss-2016b/config/"

## run BUSCO and declare paths to files necessary for analysis
python /scratch/mutemi/BUSCO_Platy_seq/scripts/run_BUSCO.py \
-i /scratch/mutemi/BUSCO_Platy_seq/platygenome_Seq_Data/platy_canu1.contigs.fasta \
-o busco_platy_canu1_1_%j \
-l /scratch/mutemi/BUSCO_Platy_seq/BUSCO_Lineages/metazoa_odb9 \
-m genome \
--long
