#!/bin/sh 

echo "Running security check"
mkdir -p $GITHUB_WORKSPACE/output
touch $GITHUB_WORKSPACE/output/security_report.txt
bandit -r $INPUT_PROJECT_PATH -c $GITHUB_WORKSPACE/.bandit.yml -$INPUT_SECURITY_LEVEL -$INPUT_SECURITY_CONFIDENCE -o $GITHUB_WORKSPACE/output/security_report.txt -f 'txt'

if [ $? -eq 0 ]; then
    echo "Security check passed, skipping reporting.."
else
    echo "Security check failed, writing to security_report"
    cat $GITHUB_WORKSPACE/output/security_report.txt
    if $INPUT_IGNORE_FAILURE; then
        exit 0
    else
        exit 1
    fi
fi
