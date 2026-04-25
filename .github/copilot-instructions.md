# Copilot Instructions

> Shared conventions: see [`.github-copilot/.github/instructions/terraform.instructions.md`](../../.github-copilot/.github/instructions/terraform.instructions.md) (sibling repo) for the standard Terraform layout, providers, remote-state pattern, validation commands, and CI/CD workflows.

## Project Overview

This is a Terraform-only repository that provisions shared Azure App Service plans for platform workloads. There is no application code; all infrastructure lives under `terraform/`.

## Repository Specifics

- `terraform/app_service_plan.tf` – The `azurerm_service_plan` resource using `for_each` over the computed plan map.
- Input variables of note: `app_service_plans` (map keyed by purpose, e.g. apps, workers), `platform_workloads_state`.

## Key Conventions

- Plans are map-driven via the `app_service_plans` variable keyed by purpose (e.g. apps, workers).
- Resource names follow the pattern `asp-{workload}-{environment}-{location}-{key}`.
- Keep names and locations lower-case.
- Add new plan variants to the `app_service_plans` map rather than duplicating resources.
- Resource groups are resolved from `platform-workloads` remote state by matching location keys.

## When Making Changes

- Prefer editing the `app_service_plans` map in tfvars files over adding new resources.
- Update `docs/development-workflows.md` if workflow behaviour changes.
