# Platform - Hosting

[![Code Quality](https://github.com/frasermolyneux/platform-hosting/actions/workflows/codequality.yml/badge.svg)](https://github.com/frasermolyneux/platform-hosting/actions/workflows/codequality.yml)
[![Build and Test](https://github.com/frasermolyneux/platform-hosting/actions/workflows/build-and-test.yml/badge.svg)](https://github.com/frasermolyneux/platform-hosting/actions/workflows/build-and-test.yml)
[![PR Verify](https://github.com/frasermolyneux/platform-hosting/actions/workflows/pr-verify.yml/badge.svg)](https://github.com/frasermolyneux/platform-hosting/actions/workflows/pr-verify.yml)
[![Deploy Dev](https://github.com/frasermolyneux/platform-hosting/actions/workflows/deploy-dev.yml/badge.svg)](https://github.com/frasermolyneux/platform-hosting/actions/workflows/deploy-dev.yml)
[![Deploy Prd](https://github.com/frasermolyneux/platform-hosting/actions/workflows/deploy-prd.yml/badge.svg)](https://github.com/frasermolyneux/platform-hosting/actions/workflows/deploy-prd.yml)
[![Destroy Development](https://github.com/frasermolyneux/platform-hosting/actions/workflows/destroy-development.yml/badge.svg)](https://github.com/frasermolyneux/platform-hosting/actions/workflows/destroy-development.yml)
[![Destroy Environment](https://github.com/frasermolyneux/platform-hosting/actions/workflows/destroy-environment.yml/badge.svg)](https://github.com/frasermolyneux/platform-hosting/actions/workflows/destroy-environment.yml)

## Documentation

* [Development Workflows](/docs/development-workflows.md) - Branch strategy, CI/CD triggers, and development flows

## Overview

Terraform-only repo that provisions shared App Service plans for downstream workloads. Plans are map-driven via `app_service_plans` and named consistently by workload, environment, and location while pulling resource groups and backends from platform-workloads remote state. GitHub Actions run OIDC-backed plans/applies for dev and prd with guarded production promotion.

## Contributing

Please read the [contributing](CONTRIBUTING.md) guidance; this is a learning and development project.

## Security

Please read the [security](SECURITY.md) guidance; I am always open to security feedback through email or opening an issue.
