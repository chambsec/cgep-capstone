# OSCAL

Machine-readable compliance documentation for the CGE-P capstone.

## Structure

oscal/
  component-definitions/
    compliant-s3-v1/
      component-definition.json   # describes the compliant-s3 Terraform module
  profiles/
    cge-p-minimum/
      profile.json                # selects sc-28, ac-3, au-3, cm-6 from NIST 800-53 Rev 5
  catalogs/
    cge-p-minimum-resolved/
      catalog.json                # resolved flat catalog of the 4 selected controls

## Component: compliant-s3-v1

Describes the primitives/compliant-s3 Terraform module. Maps four NIST 800-53 Rev 5
controls to specific Terraform resources and links each to the signed evidence bundle
in the Lab 2.5 Object Lock vault.

| Control | Implementation | Evidence |
|---------|---------------|---------|
| SC-28 | aws_s3_bucket_server_side_encryption_configuration.primary | Signed vault bundle |
| AC-3 | aws_s3_bucket_public_access_block.primary | Signed vault bundle |
| AU-3 | aws_s3_bucket_logging.primary | Signed vault bundle |
| CM-6 | aws_s3_bucket_versioning.primary + provider default_tags | Signed vault bundle |

## Evidence URIs

All links[rel=evidence].href values point to:

s3://cgep-lab-grc-evidence-vault-95715f3d/runs/26380796981/

This bundle was signed with Cosign keyless signing via GitHub OIDC in Lab 4.4.
Run scripts/verify-evidence.sh 26380796981 --vault cgep-lab-grc-evidence-vault-95715f3d
to verify the chain of custody.

## Validation

Both documents validated with trestle v4.0.3 against OSCAL 1.2.1.
See evidence/lab-6-1/ for captured validation output.