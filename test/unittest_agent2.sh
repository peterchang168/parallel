#!/bin/sh
if [ "$#" -lt "1" ]; then
	echo "error: not enough parameters."
	echo "usage: $0 [workspace_dir]"
	exit -1
fi

CWD="$1"

mkdir -p /tmp/agent2_test
cp ${CWD}/bin/agent2.py /tmp/agent2_test
cp ${CWD}/test/unittest/unittest_agent2.py /tmp/agent2_test
mkdir -p /tmp/agent2_test/report
nosetests -v -s -x --with-xunit --xunit-file=$CIRCLE_TEST_REPORTS/agent2_unit_result.xml --cover-erase --with-coverage --cover-package=agent2 -w /tmp/agent2_test/ unittest_agent2.py
coverage xml -o $CIRCLE_TEST_REPORTS/agent2_coverage.xml /tmp/agent2_test/agent2.py

