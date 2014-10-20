#!/bin/bash

set -e

#edit sudoers with visudo credits to here:
#https://www.ibm.com/developerworks/community/blogs/brian/entry/edit_sudoers_file_from_a_script4?lang=en
if [ ! -z "$1" ]; then
        echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> $1
        sed -i "s/^.*requiretty/#Defaults requiretty/" $1
else
        export EDITOR=$0
        visudo
fi