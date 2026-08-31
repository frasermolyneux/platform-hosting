# AGENTS.md - platform-hosting

This repository provisions shared Azure App Service plans for platform workloads. It owns the plans only; workload resource groups and deployment context come from `platform-workloads` remote state.

## Key locations

- `terraform/app_service_plan.tf` - map-driven `azurerm_service_plan` resources.
- `terraform/variables.tf` and `terraform/locals.tf` - plan inputs, naming, and derived configuration.
- `terraform/remote_state.tf` - `platform-workloads` state contract.
- `terraform/backends/` and `terraform/tfvars/` - `dev` and `prd` environment selection.
- `docs/development-workflows.md` - deployment and promotion behavior.

## Validation

For documentation or Copilot-configuration-only changes:

```pwsh
git diff --check
```

For Terraform changes:

```pwsh
terraform -chdir=terraform fmt -check -recursive
terraform -chdir=terraform init -backend=false -upgrade
terraform -chdir=terraform validate
```

Run a state-backed plan only when Terraform behavior changes, selecting matching files:

```pwsh
terraform -chdir=terraform init -reconfigure -backend-config=backends/dev.backend.hcl
terraform -chdir=terraform plan -var-file=tfvars/dev.tfvars
```

Use the `prd` backend and tfvars together for production changes.

## Guardrails

- Add plan variants through the `app_service_plans` map; do not duplicate resources.
- Keep names and locations lower-case and preserve `asp-{workload}-{environment}-{location}-{key}` naming.
- Preserve the `platform-workloads` remote-state shape and location-key matching.
- Use OIDC or managed identity; never add client secrets or credentials.
- `.terraform.lock.hcl` is local generated state, ignored, and not committed.
- App Service plan changes can affect every workload hosted on the changed plan; review capacity, SKU, zone, and operating-system changes accordingly.

See [README.md](README.md) and [docs/development-workflows.md](docs/development-workflows.md).
