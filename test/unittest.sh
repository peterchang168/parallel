#!/bin/sh

nosetests -v -s -x --with-xunit --xunit-file=$CIRCLE_TEST_REPORTS/redis_agent_unit_result.xml --cover-erase --with-coverage --cover-package=new_domain_redis_agent -w /tmp/new_domain_redis_agent_test/ unittest_new_domain_redis_agent.py
coverage xml -o $CIRCLE_TEST_REPORTS/redis_agent_coverage.xml /tmp/new_domain_redis_agent_test/new_domain_redis_agent.py

