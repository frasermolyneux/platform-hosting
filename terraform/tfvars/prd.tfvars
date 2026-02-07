environment     = "prd"
location        = "uksouth"
subscription_id = "903b6685-c12a-4703-ac54-7ec1ff15ca43"

platform_workloads_state = {
  resource_group_name  = "rg-tf-platform-workloads-prd-uksouth-01"
  storage_account_name = "sadz9ita659lj9xb3"
  container_name       = "tfstate"
  key                  = "terraform.tfstate"
  subscription_id      = "7760848c-794d-4a19-8cb2-52f71a21ac2b"
  tenant_id            = "e56a6947-bb9a-4a6e-846a-1f118d1c3a14"
}

app_service_plans = {
  default = {
    sku      = "B2"
    os_type  = "Linux"
    location = "swedencentral"
  }
}

static_web_apps = {
  default = {
    sku_tier = "Standard"
    sku_size = "Standard"
    location = "westeurope"
  }
}

tags = {
  Environment = "prd"
  Workload    = "platform-hosting"
  DeployedBy  = "GitHub-Terraform"
  Git         = "https://github.com/frasermolyneux/platform-hosting"
}
