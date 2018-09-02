#!/bin/bash

project_name="test-project-dashboard"
all_projects=`oc projects`

# check if project already exists if $project_name in $all_projects
if [ `echo $all_projects |grep -c $project_name` -gt 0 ]; then
	echo "Project name $project_name already exist, please delete it first."
	exit 1
else
	oc new-project $project_name
fi
oc create -f project-dashboard.yaml
oc new-app --template=test-project-dashboard

exit 0
