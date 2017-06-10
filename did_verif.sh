#!/bin/bash
#===============================================================================

#         FILE: did_verif

#        USAGE: ./did_verif full_format_dir_path_as_argument

#       AUTHOR: Denys Natalchuk ( Denys.Natalchuk@sizmek.com )

# ORGANIZATION: StrikeAd

#      CREATED: 06/06/2017

# REQUIREMENTS: n/a

#===============================================================================
cd $1
file ./*
echo -e "\n***************************"
for i in `ls` ; do head -5 $i ; done
echo -e "\n***************************"
for i in `ls` ; do tail -5 $i ; done
echo -e "\n***************************"
for i in `ls` ; do wc -l $i ; done
echo -e "\n***************************"
echo -e "\n***************************"
echo "Data checking - completed"
echo "***************************"
