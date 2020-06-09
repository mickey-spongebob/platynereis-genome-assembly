#!/bin/bash
#SBATCH --mail-user=kevin.mutemi@embl.de
#SBATCH --mail-type=ALL
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --mem=64G
#SBATCH --time=24:00:00
#SBATCH -C "epyc"

## Load required STAR module
module load STAR/2.6.0c-foss-2018b

## Run STAR on JanCANU genome assembly vs. Platy RNA_Transcriptome
# Generating genome indices and place them in an index directory 
STAR --runThreadN 16 --runMode genomeGenerate \
--genomeDir /scratch/mutemi/STAR_Platy/index/ \
--genomeFastaFiles canu_pacbio.contigs.fasta \

# Map RNA-seq data to 'genome'
STAR --runThreadN 16 --genomeDir /scratch/mutemi/STAR_Platy/index/ \
--readFilesIn 61GNRAAXX_PduStomo1_10s000584-1-1_Simakov_s_5_1.fq,C1CJRACXX_PduCirri_1_12s006912-1-1_Larsson_lane112s006912_1.fq,\
C1CJRACXX_PduCirri_2_12s006916-1-1_Larsson_lane112s006916_1.fq,C1CJRACXX_PduPalpae_1_12s006913-1-1_Larsson_lane112s006913_1.fq,\
C1CJRACXX_PduPalpae_2_12s006917-1-1_Larsson_lane112s006917_1.fq,C1CJRACXX_PduParapodia_1_12s006915-1-1_Larsson_lane112s006915_1.fq,\
C1CJRACXX_PduParapodia_2_12s006919-1-1_Larsson_lane112s006919_1.fq,C1UY6ACXX_2W-1510_12s008000-1-1_Achim_lane112s008000_1.fq,\
C1UY6ACXX_2W-3010_12s008001-1-1_Achim_lane112s008001_1.fq,C1UY6ACXX_5D-298_12s008002-1-1_Achim_lane112s008002_1.fq,\
C1UY6ACXX_5D-3010_12s008003-1-1_Achim_lane112s008003_1.fq,C1UY6ACXX_IMA-Np_12s008006-1-1_Achim_lane212s008006_1.fq,\
C1UY6ACXX_IMA-dp_12s008004-1-1_Achim_lane112s008004_1.fq,C1UY6ACXX_IMA-mb_12s008005-1-1_Achim_lane212s008005_1.fq,\
C1UY6ACXX_SMA-Mb_12s008008-1-1_Achim_lane212s008008_1.fq,C1UY6ACXX_SMA-Np_12s008009-1-1_Achim_lane212s008009_1.fq,\
C1UY6ACXX_SMA-dp_12s008007-1-1_Achim_lane212s008007_1.fq,D1UKUACXX_PV-AB1_12s007836-1-1_Vopalensky_lane112s007836_1.fq,\
D1UKUACXX_PV-AB3_12s007837-1-1_Vopalensky_lane112s007837_1.fq,D1UKUACXX_PV-CD1_12s007838-1-1_Vopalensky_lane112s007838_1.fq,\
D1UKUACXX_PV-CD3_12s007839-1-1_Vopalensky_lane112s007839_1.fq,D1UKUACXX_PV-D3_12s007840-1-1_Vopalensky_lane112s007840_1.fq,\
NG-5382_Pdu_10d_read_1_uniq_1.fq,NG-5382_Pdu_15d_read_1_uniq_1.fq,NG-5382_Pdu_1month_POST_read_1_uniq_1.fq,\
NG-5382_Pdu_1month_PRE_read_1_uniq_1.fq,NG-5382_Pdu_24h_read_1_uniq_1.fq,NG-5382_Pdu_36h_read_1_uniq_1.fq,NG-5382_Pdu_48h_read_1_uniq_1.fq,\
NG-5382_Pdu_3month_read_1_uniq_1.fq,NG-5382_Pdu_4d_read_1_uniq_1.fq,\
NG-5382_Pdu_72h_read_1_uniq_1.fq,NG-5382_Pdu_EGG_read_1_uniq_1.fq,NG-5382_Pdu_female_epitoke_read_1_uniq_1.fq,\
NG-5382_Pdu_male_epitoke_read_1_uniq_1.fq \
61GNRAAXX_PduStomo1_10s000584-1-1_Simakov_s_5_2.fq,C1CJRACXX_PduCirri_1_12s006912-1-1_Larsson_lane112s006912_2.fq,\
C1CJRACXX_PduCirri_2_12s006916-1-1_Larsson_lane112s006916_2.fq,C1CJRACXX_PduPalpae_1_12s006913-1-1_Larsson_lane112s006913_2.fq,\
C1CJRACXX_PduPalpae_2_12s006917-1-1_Larsson_lane112s006917_2.fq,C1CJRACXX_PduParapodia_1_12s006915-1-1_Larsson_lane112s006915_2.fq,\
C1CJRACXX_PduParapodia_2_12s006919-1-1_Larsson_lane112s006919_2.fq,C1UY6ACXX_2W-1510_12s008000-1-1_Achim_lane112s008000_2.fq,\
C1UY6ACXX_2W-3010_12s008001-1-1_Achim_lane112s008001_2.fq,C1UY6ACXX_5D-298_12s008002-1-1_Achim_lane112s008002_2.fq,\
C1UY6ACXX_5D-3010_12s008003-1-1_Achim_lane112s008003_2.fq,C1UY6ACXX_IMA-Np_12s008006-1-1_Achim_lane212s008006_2.fq,\
C1UY6ACXX_IMA-dp_12s008004-1-1_Achim_lane112s008004_2.fq,C1UY6ACXX_IMA-mb_12s008005-1-1_Achim_lane212s008005_2.fq,\
C1UY6ACXX_SMA-Mb_12s008008-1-1_Achim_lane212s008008_2.fq,C1UY6ACXX_SMA-Np_12s008009-1-1_Achim_lane212s008009_2.fq,\
C1UY6ACXX_SMA-dp_12s008007-1-1_Achim_lane212s008007_2.fq,D1UKUACXX_PV-AB1_12s007836-1-1_Vopalensky_lane112s007836_2.fq,\
D1UKUACXX_PV-AB3_12s007837-1-1_Vopalensky_lane112s007837_2.fq,D1UKUACXX_PV-CD1_12s007838-1-1_Vopalensky_lane112s007838_2.fq,\
D1UKUACXX_PV-CD3_12s007839-1-1_Vopalensky_lane112s007839_2.fq,D1UKUACXX_PV-D3_12s007840-1-1_Vopalensky_lane112s007840_2.fq,\
NG-5382_Pdu_10d_read_1_uniq_2.fq,NG-5382_Pdu_15d_read_1_uniq_2.fq,NG-5382_Pdu_1month_POST_read_1_uniq_2.fq,\
NG-5382_Pdu_1month_PRE_read_1_uniq_2.fq,NG-5382_Pdu_24h_read_1_uniq_2.fq,NG-5382_Pdu_36h_read_1_uniq_2.fq,NG-5382_Pdu_48h_read_1_uniq_2.fq,\
NG-5382_Pdu_3month_read_1_uniq_2.fq,NG-5382_Pdu_4d_read_1_uniq_2.fq,NG-5382_Pdu_72h_read_1_uniq_2.fq,\
NG-5382_Pdu_EGG_read_1_uniq_2.fq,NG-5382_Pdu_female_epitoke_read_1_uniq_2.fq,NG-5382_Pdu_male_epitoke_read_1_uniq_2.fq \
--outFilterType BySJout \
--outFilterMultimapNmax 20 \
--alignIntronMin 20 \
--alignIntronMax 1000000
