#!/bin/bash
#PBS -l walltime=48:00:00
#PBS -l select=1:ncpus=32:mem=100gb

# Cluster Environment Setup
cd $PBS_O_WORKDIR

module load anaconda3
module load anaconda3/personal
source activate fenicsproject
# Check that FIRST_PORT and NUM_PORT variables are set
# TODO


NUM_PORT=20
# check that all ports are free
#output=$(python3 -c "from utils import bash_check_avail; bash_check_avail($NUM_PORT)")



# if I went so far, all ports are free: can launch!

# launch everything:
#JOB_ID_SPLIT=${PBS_JOBID%.*}
#mkdir $HOME/jobs/$JOB_ID_SPLIT
# launch servers
echo "Launching the servers. This takes a few seconds..."
let "n_sec_sleep = 20 * $NUM_PORT"
echo "Wait $n_sec_sleep secs for servers to start..."

#sleep 2

#python3 launch_servers.py -p $FIRST_PORT -n $NUM_PORT&

sleep $n_sec_sleep

python3 launch_parallel_training.py -n $NUM_PORT

echo "Launched training!"

exit 0
