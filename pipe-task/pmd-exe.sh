#!/bin/sh

pmd_report_file='pmd.xml'
pmd_cmd="-Xmx512m -jar /pmd-bin-4.2.6/lib/pmd-4.2.6.jar ./ xml rsc-git/pmd-rules/EgovInspectionRules_kor.xml"
pmd_err_word='<violation'

java $pmd_cmd > $pmd_report_file

if [ $? -eq 0 ]; then
        cmd=echo grep -c $pmd_err_word $pmd_report_file

        if [ $? -eq 0 ]; then
                echo "pmd violation $cmd deteded"
                exit 1
        else
                echo "pmd check success"
                exit 0
        fi
else
        exit $?
fi
