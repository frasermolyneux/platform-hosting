# Copilot Instructions

## Project Overview

This is a Terraform-only repository that provisions shared Azure App Service plans for platform workloads. There is no application code; all infrastructure lives under `terraform/`.

## Repository Layout

- `terraform/providers.tf` – Terraform/provider version constraints and azurerm backend config.
- `terraform/remote_state.tf` – Remote state data source for `platform-workloads` (OIDC-backed).
- `terraform/variables.tf` – Input variables: `environment`, `workload_name`, `location`, `subscription_id`, `platform_workloads_state`, `app_service_plans`, `tags`.
- `terraform/locals.tf` – Naming logic, location normalisation, resource group lookup, and tag merging.
- `terraform/app_service_plan.tf` – The `azurerm_service_plan` resource using `for_each` over the computed plan map.
- `terraform/outputs.tf` – Outputs the created App Service plan details.
- `terraform/backends/` and `terraform/tfvars/` – Per-environment backend configs and variable files.
- `docs/development-workflows.md` – Branch strategy, CI/CD triggers, and developer flow documentation.

## Key Conventions

- Plans are map-driven via the `app_service_plans` variable keyed by purpose (e.g. apps, workers).
- Resource names follow the pattern `asp-{workload}-{environment}-{location}-{key}`.
- Keep names and locations lower-case; tag all resources via `tags` plus default `Environment`/`Workload` tags.
- Add new plan variants to the `app_service_plans` map rather than duplicating resources.
- Resource groups are resolved from `platform-workloads` remote state by matching location keys.

## Provider Requirements

- Terraform >= 1.14.3
- `azurerm` ~> 4.58 with `storage_use_azuread = true`
- `azuread` ~> 3.7
- Backend: `azurerm` (Azure Blob with OIDC)

## Local Validation

```bash
terraform -chdir=terraform init -backend-config=backends/dev.backend.hcl
terraform -chdir=terraform plan -var-file=tfvars/dev.tfvars
```

## CI/CD Workflows

- `build-and-test.yml` – Feature branch pushes trigger a Dev Terraform plan.
- `pr-verify.yml` – PRs run a Dev plan; add `run-prd-plan` label for Prd plan.
- `deploy-dev.yml` – Manual dispatch for Dev plan and apply.
- `deploy-prd.yml` – Push to main, weekly schedule, or manual; runs Dev apply then Prd apply.
- `destroy-development.yml` / `destroy-environment.yml` – Teardown workflows.
- All workflows use OIDC with environment variables: `AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID`.

## When Making Changes

- Prefer editing the `app_service_plans` map in tfvars files over adding new resources.
- Run `terraform fmt -check -recursive terraform/` and `terraform validate` before committing.
- Update `docs/development-workflows.md` if workflow behaviour changes.
