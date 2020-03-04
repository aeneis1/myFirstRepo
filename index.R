#dcm2nifiConverter.R

setwd("~/R_demo")
library(utils)
library(neurobase)
library(dcm2niir)
library(scales)

# read dicome images and convert it into nifiti format
dcmDir="/home/griffith/R_demo/BrainRoutine/MR_t1_mprage_tra_p2_iso"
res=dcm2nii(basedir = dcmDir)
stopifnot(res$result==0)
check_dcm2nii(res)
nfImg <- readnii(res$nii_after,reorient = FALSE)
outFile="MR_t1_mprage_tra_p2_iso"
writenii(nfImg,outFile)
blnExist <-file.exists(paste0(outFile,".nii.gz"))
