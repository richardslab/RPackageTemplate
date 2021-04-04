#!/bin/bash

BASEDIR="$(dirname "$0")"

ENV=Template
# shellcheck source=/dev/null
set +eu \
  && PS1='$$$ ' \
  && . "$(conda info --base)"/etc/profile.d/conda.sh \
  && conda activate base \
  && conda install -y -c conda-forge mamba 
set -eu;

conda deactivate || echo "no active environment"
conda env remove -n ${ENV} || echo "couldn't remove environment ${ENV}"
conda create -y -n ${ENV}  || echo "it seem that environment ${ENV} is already present"

mamba env update -q --file "$BASEDIR"/environment.yml 

echo CREATED the environment ${ENV}
