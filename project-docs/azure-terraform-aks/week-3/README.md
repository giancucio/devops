# Week 3 Observability and Alerting

Goal: build practical monitoring and alerting workflows using the Azure observability stack already provisioned by Terraform.

## What Terraform Already Provisioned

| Resource | Purpose |
|---|---|
| Log Analytics Workspace (`law-aks-dev-eastus`) | Container log ingestion, cluster diagnostics |
| Application Insights (`appi-aks-dev-eastus`) | Distributed traces, custom metrics from Flask api |
| Azure Monitor Workspace (`amw-aks-dev-eastus`) | Managed Prometheus scraping |
| Azure Managed Grafana (`grafana-aks-dev-eastus`) | Dashboards connected to Prometheus and Log Analytics |

## Daily Plan

1. Day 1: Verify data path — confirm Container Insights logs flowing, AppInsights receiving traces from `/message` and `/demo-error`
2. Day 2: Build golden signal dashboards in Grafana (latency, traffic, errors, saturation)
3. Day 3: Create alert rules — pod crash loop, high error rate on `/demo-error`, node memory pressure
4. Day 4: Correlation drill — trigger `/demo-error`, follow alert → Log Analytics → AppInsights trace
5. Day 5: Alert quality review — tune thresholds, eliminate noise, write runbook per alert

## Golden Signals for This App

| Signal | Source | Query target |
|---|---|---|
| Latency | AppInsights requests table | p50/p95 response time on `/message` |
| Traffic | AppInsights requests table | Requests per minute per endpoint |
| Errors | AppInsights exceptions table | `/demo-error` failure rate |
| Saturation | Prometheus | CPU/memory utilization per pod |

## Exit Criteria

- You can detect and triage a `/demo-error` spike from alert to root cause in under 15 minutes
- Dashboards show all 4 golden signals for the api service
- At least 3 actionable alert rules configured with runbook links
