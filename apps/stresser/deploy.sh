oc new-project test
oc create -f stresser.yaml
oc new-app --template=stresser-template --param=PROJECT_NAME=test --param=REPLICAS=3
sleep 10
oc start-build stresser
