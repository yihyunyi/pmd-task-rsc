#!/bin/sh

pmd_report_file='rsc-git/pmd.xml'
pmd_cmd="-Xmx512m -jar /pmd-bin-4.2.6/lib/pmd-4.2.6.jar ./ xml rsc-git/pmd-rules/EgovInspectionRules_kor.xml"
pmd_err_word='<violation'
pmd_report_cnt="$(java $pmd_cmd | grep -c $pmd_err_word)"

#java $pmd_cmd > $pmd_report_file

#if [ $? -eq 0 ]; then
	cnt=$pmd_report_cnt

        if [ $cnt -gt 0 ]; then
                echo "pmd violation $cnt deteded"
                exit 1
        else
                echo "pmd check success"
                exit 0
        fi
#else
        exit $?
#fi
