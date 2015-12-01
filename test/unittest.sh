#!/bin/sh
if [ "$#" -lt "1" ]; then
	echo "error: not enough parameters."
	echo "usage: $0 [workspace_dir]"
	exit -1
fi

CWD="$1"

mkdir -p /tmp/new_domain_redis_agent_test
cp ${CWD}/bin/new_domain_redis_agent.py /tmp/new_domain_redis_agent_test
cp ${CWD}/test/unittest/unittest_new_domain_redis_agent.py /tmp/new_domain_redis_agent_test
mkdir -p /tmp/new_domain_redis_agent_test/report
nosetests -v -s -x --with-xunit --xunit-file=$CIRCLE_TEST_REPORTS/redis_agent_unit_result.xml --cover-erase --with-coverage --cover-package=new_domain_redis_agent -w /tmp/new_domain_redis_agent_test/ unittest_new_domain_redis_agent.py
coverage xml -o $CIRCLE_TEST_REPORTS/redis_agent_coverage.xml /tmp/new_domain_redis_agent_test/new_domain_redis_agent.py

