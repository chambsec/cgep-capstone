# aws-baseline

Deploys the AWS-native security services baseline for the CGE-P capstone.
Terraform-managed, evidence captured as JSON.

## Services and controls

| Service | NIST 800-53 Controls | What it does |
|---------|---------------------|--------------|
| CloudTrail | AU-2, AU-12, AU-10 | Multi-region management event logging with log-file validation |
| Security Hub | RA-5, SI-4 | Aggregates findings from native checks; NIST 800-53 Rev 5 + FSBP subscribed |
| AWS Config | CM-2, CM-6, CM-8 | Resource inventory and configuration recording (deploy separately if not SCP-blocked) |

## CloudTrail (AU-2, AU-12, AU-10)

`enable_log_file_validation = true` causes CloudTrail to emit a signed
digest file every hour. An auditor can use it to detect tampering with
log files — that is AU-10 (integrity of audit information) for free.
`is_multi_region_trail = true` ensures API calls in every region are captured.

## Security Hub (RA-5, SI-4)

Two standards subscribed:
- NIST 800-53 Rev 5 — directly maps to the controls in this capstone
- AWS Foundational Security Best Practices (FSBP) — AWS-curated baseline

Findings are captured as `evidence/lab-5-2/security-hub-findings.json`
and uploaded to the Lab 2.5 evidence vault.

## Evidence

`evidence/lab-5-2/security-hub-findings.json` — first wave of Security Hub
findings captured post-deploy. The capstone OSCAL component's implemented-
requirement for AU-2, AU-10, RA-5, and SI-4 points at a signed copy of
this file in the evidence vault.