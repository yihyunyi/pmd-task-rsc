#!/bin/sh

pmd_cmd="-Xmx512m -jar /pmd-bin-4.2.6/lib/pmd-4.2.6.jar ./ xml rsc-git/pmd-rules/EgovInspectionRules_kor.xml"
pmd_err_word='<violation'
pmd_report_cnt="$(java $pmd_cmd | grep -c $pmd_err_word)"

cnt=$pmd_report_cnt

if [ $cnt -gt 0 ]; then
	echo -e "\x1B[31m pmd violation $cnt deteded \x1B[0m"
	java $pmd_cmd
        exit 1
else
        echo "pmd check success"
        exit 0
fi
