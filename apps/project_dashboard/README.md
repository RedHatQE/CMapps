# Project Dashboard


Create an openShift project, that will be used for CFME project dashboard tests.
The project will include:
 - 5 PODs (one of the will be on Failed status)
 - 6 Containers
 - 1 Service

Note:
If openShift already has a project with the same name, the script will raise an error message and won't proceed. 

# Getting started
  - Clone the project.
  - cd project_dashboard
  - run the script that will create the project and its content:
    setup-project-dashboard.sh
