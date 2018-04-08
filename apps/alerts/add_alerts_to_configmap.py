#/bin/python

import os
import argparse
from yaml import load, dump

CONFIGMAP_YAML_PATH = "/tmp/alerts-configmap.yaml"

def expose_configmap():
    os.system("oc get configmap prometheus -n openshift-metrics -o yaml > {configmap_path}".format(configmap_path=CONFIGMAP_YAML_PATH))

def add_alert_definition(alert_defs):
    with open(CONFIGMAP_YAML_PATH, "rw") as configmap_file:
        configmap = load(configmap_file)
        configmap["data"]["automation-alerts"] = alert_defs
        dump(configmap. configmap_file)

def load_alert_defs(alert_path):
    with open(alert_path, "r") as file:
        return load(file)

def reload_configmap():
    os.system("oc edit configmap prometheus -n openshift-metrics <  {configmap_path}".format(configmap_path=CONFIGMAP_YAML_PATH))

def main():
    parser = argparse.ArgumentParser(description='Update Prometheus alerts configmap')

    parser.add_argument('definitions', type=str,
                        help='new alert definitions to add')

    args = parser.parse_args()
    expose_configmap()
    add_alert_definition(load_alert_defs(args.definitions))
    reload_configmap()

if __name__ == "__main__":
    main()
