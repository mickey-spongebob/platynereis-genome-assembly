#!/bin/bash
#SBATCH --mail-user=kevin.mutemi@embl.de
#SBATCH --mail-type=ALL
#SBATCH --mem=36G
#SBATCH --time=07-00:00:00
#SBATCH -N 1

## load required modules
module load busco/3.0.1-foss-2016b-Python-2.7.12

## load config.ini file
export BUSCO_CONFIG_FILE="/g/arendt/kevin/Genome_Analysis/BUSCO/BUSCO_tXome/config/config.ini.platy"

## re-export the AUGUSTUS config path to allow write access for training algorithm
export AUGUSTUS_CONFIG_PATH="/g/arendt/kevin/Genome_Analysis/BUSCO/3.2.3-foss-2016b/config/"

## run BUSCO and declare paths to files necessary for analysis
python run_BUSCO.py \
-i platy.falcon.fa \
-o busco_platy_falcon_pacbio \
-l /g/arendt/kevin/Genome_Analysis/BUSCO/BUSCO_lineages/metazoa_odb9 \
-m genome \
--long
