#!/bin/bash
#PBS -q serial
#PBS -l select=1:ncpus=1:mem=15GB
#PBS -l walltime=500:00:00
#PBS -j oe

cd $PBS_O_WORKDIR
source /etc/profile.d/rec_modules.sh
module load miniconda
source activate mirbird
cd /hpctmp/yanyun/MirBird
Species=('Acanthisitta_chloris' 'Accipiter_gentilis' 'Acridotheres_tristis')
Accessions=('GCA_016904835.1' 'GCA_929443795.1' 'GCA_027559615.1')
for i in {0..2}
do
ncbi-genome-download --formats fasta -A "${Accessions[$i]}" vertebrate_other -v -o "${Species[$i]}"
cd ./"${Species[$i]}"
find . -name "*.fna.gz" -exec mv -i {} ./ \;
gzip -d *.fna.gz
MirMachine.py --node Neoaves --species "${Species[$i]}" --genome *.fna --cpu 24
cp results ../ -r
cd ../
rm ./"${Species[$i]}" -rf
done

