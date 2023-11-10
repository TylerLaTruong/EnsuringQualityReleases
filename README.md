[![Build Status](https://dev.azure.com/odluser242834/UdacityAzureDevOps3/_apis/build/status%2Fhoankhai811.Ensuring-Quality-Releases-Project?branchName=main)](https://dev.azure.com/odluser242834/UdacityAzureDevOps3/_build/latest?definitionId=4&branchName=main)

# Overview

Udacity final project Ensuring Quality Releases

# Project Structure 

- **azure-pipelines.yaml**: Azure pipelines yaml
- **automatedtesting**: Suites of different tests
  - **jmeter**: Load test (JMeterPlan.jmx), CSV inputs, and TestReports (endurance-report, stress-report)
  - **postman**: Functional tests postman collections and environments
  - **selenium**: Ui tests (uitests.py)
- **screenshoots**: All screen shots requests
- **terraform**: Terraform scripts
---

## Environment Creation & Deployment

- Terraform to apply Infrastructure as Code (IaC)
  - Screenshots of the log output of Terraform when executed by the CI/CD pipeline
   ![Screenshot_1_Resources_Created_By_Terraform.png](screenshots/Screenshot_1_Resources_Created_By_Terraform.png)
   ![Screenshot_2_Install_DevOps_Agent.png](screenshots/Screenshot_2_Install_DevOps_Agent.png)
   ![Screenshot_3_Run_Terraform_In_Pipelines_Success.png](screenshots/Screenshot_3_Run_Terraform_In_Pipelines_Success.png)
   ![Screenshot_4_Terraform_State.png](screenshots/Screenshot_4_Terraform_State.png)

- Automated testing tasks
  - Screenshot of the successful execution of the pipeline build results page (/_build/results?buildId={id}&view=results)
    ![Screenshot_5_Complete_Final_Pipeline.png](screenshots/Screenshot_5_Complete_Final_Pipeline.png)

## Automated Testing

- Load test suite 
  - Screenshot of the log output of JMeter when executed by the CI/CD pipeline
    ![Screenshot_6_Load_Tests_Result_1.png](screenshots/Screenshot_6_Load_Tests_Result_1.png)
    ![Screenshot_6_Load_Tests_Result_2.png](screenshots/Screenshot_6_Load_Tests_Result_2.png)
  
- Functional test suites 
  - Screenshot of the execution of the test suite by the CI/CD pipeline
   ![Screenshot_7_Functional_Tests_Result.png](screenshots/Screenshot_7_Functional_Tests_Result.png)

- API-integration tests
  - Screenshot of the output of the Publish Test Results step
    ![Screenshot_8_Public_Tests_Result.png](screenshots/Screenshot_8_Public_Tests_Result.png)
  - Screenshot of the Run Summary page (which contains 4 graphs)
    ![Screenshot_9_Test_Report_Summary.png](screenshots/Screenshot_9_Test_Report_Summary.png)
  - Screenshot of the Test Results page (which contains the test case titles from each test) 
    ![Screenshot_10_Test_Report_Results.png](screenshots/Screenshot_10_Test_Report_Results.png)

## Monitoring & Observability

- Configure Azure Monitor
  - Screenshots of the graphs of the resource that the alert was triggered
    ![Screenshot_11_Alert_Summary.png](screenshots/Screenshot_11_Alert_Summary.png)
  - Screenshots of the alert rule
    ![Screenshot_12_Alert_Rule.png](screenshots/Screenshot_12_Alert_Rule.png)
    ![Screenshot_13_AppService_Alerts.png](screenshots/Screenshot_13_AppService_Alerts.png)
  - Screenshots of the email received when the alert is triggered
    ![Screenshot_14_Alert_Email.png](screenshots/Screenshot_14_Alert_Email.png)

- Azure Log Analytics
  - Screenshots of log analytics queries and result sets which will show specific output of the Azure resource
    ![Screenshot_15_LogAnalytics_Queries.png](screenshots/Screenshot_15_LogAnalytics_Queries.png)

    Note: if you udacity account lab, when run terraform apply in pipeline very long time because resourec group locked you need unlock follow step in local:

    `$ terraform init`
    `$ terraform import modules.resource_group.azurerm_resource_group.test /subscriptions/subscriptionid/resourceGroups/AzureDevops` 
