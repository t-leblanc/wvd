# connect to azure - using subscription ID
Connect-AzAccount -Subscription "f0fc0748-2a2d-4998-90cc-66525be9d5f3" -Tenant "a9f03c47-8cbd-4397-bf14-2dd27bb2cdea"

# set the context to a specific subscription
Set-AzContext -SubscriptionId "f0fc0748-2a2d-4998-90cc-66525be9d5f3" -TenantId "41ab8480-2833-4b95-b54a-5c60538fa699"

# list all resource groups in the subscription
Get-AzResourceGroup | Select-Object -Property ResourceGroupName,Location


# deploy your resources...

# Deploy Session Hosts for PRD Pooled Host Pool
Test-AzResourceGroupDeployment -ResourceGroupName "wergadds" -TemplateFile ".\Infra-As-Code\ADDS\deploy.json" -TemplateParameterFile ".\Infra-As-Code\ADDS\Parameters\parameters.json" -Verbose
New-AzResourceGroupDeployment -ResourceGroupName "wergadds" -TemplateFile ".\Infra-As-Code\ADDS\deploy.json" -TemplateParameterFile ".\Infra-As-Code\ADDS\Parameters\parameters.json" -Verbose

