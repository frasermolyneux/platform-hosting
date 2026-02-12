# platform-hosting

[![Build and Test](https://github.com/frasermolyneux/platform-hosting/actions/workflows/build-and-test.yml/badge.svg)](https://github.com/frasermolyneux/platform-hosting/actions/workflows/build-and-test.yml)
[![Code Quality](https://github.com/frasermolyneux/platform-hosting/actions/workflows/codequality.yml/badge.svg)](https://github.com/frasermolyneux/platform-hosting/actions/workflows/codequality.yml)
[![Copilot Setup Steps](https://github.com/frasermolyneux/platform-hosting/actions/workflows/copilot-setup-steps.yml/badge.svg)](https://github.com/frasermolyneux/platform-hosting/actions/workflows/copilot-setup-steps.yml)
[![Dependabot Auto-Merge](https://github.com/frasermolyneux/platform-hosting/actions/workflows/dependabot-automerge.yml/badge.svg)](https://github.com/frasermolyneux/platform-hosting/actions/workflows/dependabot-automerge.yml)
[![Deploy Dev](https://github.com/frasermolyneux/platform-hosting/actions/workflows/deploy-dev.yml/badge.svg)](https://github.com/frasermolyneux/platform-hosting/actions/workflows/deploy-dev.yml)
[![Deploy Prd](https://github.com/frasermolyneux/platform-hosting/actions/workflows/deploy-prd.yml/badge.svg)](https://github.com/frasermolyneux/platform-hosting/actions/workflows/deploy-prd.yml)
[![Destroy Development](https://github.com/frasermolyneux/platform-hosting/actions/workflows/destroy-development.yml/badge.svg)](https://github.com/frasermolyneux/platform-hosting/actions/workflows/destroy-development.yml)
[![Destroy Environment](https://github.com/frasermolyneux/platform-hosting/actions/workflows/destroy-environment.yml/badge.svg)](https://github.com/frasermolyneux/platform-hosting/actions/workflows/destroy-environment.yml)
[![PR Verify](https://github.com/frasermolyneux/platform-hosting/actions/workflows/pr-verify.yml/badge.svg)](https://github.com/frasermolyneux/platform-hosting/actions/workflows/pr-verify.yml)

## Documentation

* [Development Workflows](/docs/development-workflows.md) - Branch strategy, CI/CD triggers, and development flows

## Overview

Terraform-only repo that provisions shared Azure App Service plans for downstream platform workloads. Plans are map-driven via the `app_service_plans` variable and named consistently by workload, environment, and location while pulling resource groups from the platform-workloads remote state. GitHub Actions workflows run OIDC-backed Terraform plans and applies for dev and prd environments with guarded production promotion. The repository contains no application code; all infrastructure is defined under the `terraform/` directory.

## Contributing

Please read the [contributing](CONTRIBUTING.md) guidance; this is a learning and development project.

## Security

Please read the [security](SECURITY.md) guidance; I am always open to security feedback through email or opening an issue.
