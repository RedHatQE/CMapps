#!/usr/bin/env bash

# Add alerts to configmap
function setup_alert_definitio_to_configmap {
    python add_alerts_to_configmap.py alert-defs.yaml
}


# Restart prometheus pod
function restart_prometheus_pod {
    echo "Waiting for pod to raise"
    while [ `oc get pods -n openshift-metrics | grep -c Running` -ne 1 ]
    do
	    oc get pods -n openshift-metrics
        sleep 3
	    echo
        echo
    done

}

# Add hello-world app
function setup_hello_world {
    oc project default > /dev/null

    # Cheack if prometheus-testing not exist
    if [ `oc get project | grep -c prometheus-testing` -ne 1 ]
    then
        oc new-project prometheus-testing --display-name="Prometheus testing" --description="This project conatins pod for prometheus testing"
    fi
}

setup_alert_definitio_to_configmap
restart_prometheus_pod
setup_hello_world
