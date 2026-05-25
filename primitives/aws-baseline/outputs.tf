output "cloudtrail_arn" {
  value       = aws_cloudtrail.mgmt.arn
  description = "ARN of the CloudTrail (AU-2, AU-12, AU-10)."
}

output "cloudtrail_bucket" {
  value       = aws_s3_bucket.trail.id
  description = "S3 bucket storing CloudTrail logs."
}

output "security_hub_arn" {
  value       = aws_securityhub_account.this.id
  description = "Security Hub account ARN (RA-5, SI-4)."
}

output "compliance_attestation" {
  description = "Machine-readable attestation of controls deployed."
  value = {
    cloudtrail_multi_region        = aws_cloudtrail.mgmt.is_multi_region_trail
    cloudtrail_log_validation      = aws_cloudtrail.mgmt.enable_log_file_validation
    cloudtrail_global_events       = aws_cloudtrail.mgmt.include_global_service_events
    security_hub_enabled           = true
    nist_800_53_subscribed         = true
    fsbp_subscribed                = true
  }
}