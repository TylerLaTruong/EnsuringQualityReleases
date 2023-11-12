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
   ![Resources_Created_By_Terraform.png](screenshot/Resources_Created_By_Terraform.png)
   ![Install_DevOps_Agent.png](screenshot/Install_DevOps_Agent.png)
   ![Run_Terraform_In_Pipelines_Success.png](screenshot/Run_Terraform_In_Pipelines_Success.png)
   ![Terraform_State.png](screenshot/Terraform_State.png)

- Automated testing tasks
  - Screenshot of the successful execution of the pipeline build results page (/_build/results?buildId={id}&view=results)
    ![Complete_Final_Pipeline.png](screenshot/Complete_Final_Pipeline.png)

## Automated Testing

- Load test suite 
  - Screenshot of the log output of JMeter when executed by the CI/CD pipeline
    ![Load_Tests_Result_1.png](screenshot/Load_Tests_Result_1.png)
    ![Load_Tests_Result_2.png](screenshot/Load_Tests_Result_2.png)
  
- Functional test suites 
  - Screenshot of the execution of the test suite by the CI/CD pipeline
   ![Functional_Tests_Result.png](screenshot/Functional_Tests_Result.png)

- API-integration tests
  - Screenshot of the output of the Publish Test Results step
    ![Public_Tests_Result.png](screenshot/Public_Tests_Result.png)
  - Screenshot of the Run Summary page (which contains 4 graphs)
    ![Test_Report_Summary.png](screenshot/Test_Report_Summary.png)
  - Screenshot of the Test Results page (which contains the test case titles from each test) 
    ![Test_Report_Results.png](screenshot/Test_Report_Results.png)

## Monitoring & Observability

- Configure Azure Monitor
  - Screenshots of the graphs of the resource that the alert was triggered
    ![Alert_Summary.png](screenshot/Alert_Summary.png)
  - Screenshots of the alert rule
    ![Alert_Rule.png](screenshot/Alert_Rule.png)
  - Screenshots of the email received when the alert is triggered
    ![Alert_Email.png](screenshot/Alert_Email.png)

    Note: if you udacity account lab, when run terraform apply in pipeline very long time because resourec group locked you need unlock follow step in local:

    `$ terraform init`
    `$ terraform import modules.resource_group.azurerm_resource_group.test /subscriptions/subscriptionid/resourceGroups/AzureDevops` 
