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

## Local dev: MCP wire-up

This repo is wired to the shared `frasermolyneux-copilot` MCP server, which exposes the org's Copilot instructions/prompts/agents catalog to MCP-capable clients (VS Code, the GitHub Copilot coding agent, Copilot CLI, etc.). The wire-up consists of `.github/workflows/copilot-setup-steps.yml` (checks out `frasermolyneux/.github-copilot` at tag `v0.1.0` and builds the server) and `.github/copilot/mcp_config.json` (declares the stdio launch for the coding agent). For the full tool surface, content-root resolution, and per-client wire-up snippets, see [`.github-copilot/mcp-server/README.md`](https://github.com/frasermolyneux/.github-copilot/blob/v0.1.0/mcp-server/README.md).
