#!/bin/sh

pmd_report_file='pmd.xml'
pmd_cmd="-Xmx512m -jar /pmd-bin-4.2.6/lib/pmd-4.2.6.jar ./ xml rsc-git/pmd-rules/EgovInspectionRules_kor.xml > $pmd_report_file"
pmd_err_word='<violation'
pmd_report_cnt="$(grep -c $pmd_err_word $pmd_report_file)"

java $pmd_cmd

if [ $? -eq 0 ]; then
	cnt=$pmd_report_cnt

        if [ $cnt -gt 0 ]; then
                echo "pmd violation $cnt deteded"
                exit 1
        else
                echo "pmd check success"
                exit 0
        fi
else
        exit $?
fi
