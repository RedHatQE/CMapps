oc new-project test
oc create -f stresser.yaml
oc new-app --template=stresser-template --param=PROJECT_NAME=test --param=REPLICAS=5
oc start-build stresser
oc deploy stresser --latest
