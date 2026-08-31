# Copilot Instructions

## Repository purpose

`platform-hosting` is a Terraform-only repository that provisions shared Azure App Service plans. It does not own workload resource groups or applications; resource groups are resolved from the `platform-workloads` remote state.

## Terraform layout and boundaries

- `terraform/app_service_plan.tf` creates `azurerm_service_plan` resources with `for_each`.
- `terraform/variables.tf` defines the `app_service_plans` map and remote-state input.
- `terraform/locals.tf` derives plan configuration and names.
- `terraform/remote_state.tf` reads `platform-workloads` through Azure Storage using OIDC.
- `terraform/backends/{dev,prd}.backend.hcl` and `terraform/tfvars/{dev,prd}.tfvars` must be selected as matching environment pairs.

Terraform requires `>= 1.15.6`. Provider constraints are authoritative in `terraform/providers.tf`: AzureRM `~> 5.2.0` and AzureAD `~> 3.9.0`. Do not change provider constraints as part of unrelated work.

Plans are map-driven. Add or change plan variants through `app_service_plans`; do not create parallel resource blocks. Preserve lower-case values and `asp-{workload}-{environment}-{location}-{key}` names. Resource-group lookup depends on location keys exposed by `platform-workloads`.

## Validation and planning

Documentation and Copilot configuration changes require `git diff --check` and link review; they do not require a Terraform plan.

For Terraform changes:

```pwsh
terraform -chdir=terraform fmt -check -recursive
terraform -chdir=terraform init -backend=false -upgrade
terraform -chdir=terraform validate
```

Run a state-backed plan only for infrastructure-affecting changes:

```pwsh
terraform -chdir=terraform init -reconfigure -backend-config=backends/dev.backend.hcl
terraform -chdir=terraform plan -var-file=tfvars/dev.tfvars
```

Substitute both `dev` values with `prd` for production. Never mix backend and tfvars environments.

## Safety

- Preserve the remote-state contract, backend configuration, and existing state addresses.
- Do not apply, import, move, or remove state unless the task explicitly requires it.
- Use OIDC or managed identity; do not add client secrets, tokens, or connection strings.
- Treat SKU, capacity, zone, OS type, and plan removal as shared-hosting blast-radius changes.
- `.terraform.lock.hcl` is generated locally, ignored, and never committed.

Detailed workflow behavior is documented in [docs/development-workflows.md](../docs/development-workflows.md).
