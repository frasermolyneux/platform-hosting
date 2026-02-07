variable "environment" {
  description = "Deployment environment (e.g. dev, prd)"
  type        = string
  default     = "dev"
}

variable "workload_name" {
  description = "Name of the workload as defined in platform-workloads state"
  type        = string
  default     = "platform-hosting"
}

variable "location" {
  description = "Primary Azure region for shared resources"
  type        = string
  default     = "uksouth"
}

variable "subscription_id" {
  description = "Subscription to deploy resources into"
  type        = string
}

variable "platform_workloads_state" {
  description = "Backend config for platform-workloads remote state (resource groups, backends)"
  type = object({
    resource_group_name  = string
    storage_account_name = string
    container_name       = string
    key                  = string
    subscription_id      = string
    tenant_id            = string
  })
}

variable "app_service_plans" {
  description = "App Service plans keyed by purpose (e.g. apps, workers)"
  type = map(object({
    sku      = string
    os_type  = string
    location = optional(string)
  }))
  default = {}
}

variable "static_web_apps" {
  description = "Static Web Apps keyed by purpose"
  type = map(object({
    sku_tier = string
    sku_size = string
    location = optional(string)
  }))
  default = {}
}

variable "tags" {
  description = "Optional resource tags"
  type        = map(string)
  default     = {}
}
