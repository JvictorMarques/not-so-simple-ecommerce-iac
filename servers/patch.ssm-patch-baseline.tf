resource "aws_ssm_patch_baseline" "this" {
  name                                 = "${local.name_prefix}-Debian-13-Patch-Baseline"
  description                          = "Patch baseline for Debian-13"
  approved_patches_enable_non_security = false
  operating_system                     = "DEBIAN"

  dynamic "approval_rule" {
    for_each = [for rule in var.patch_baseline : rule.approval_rule]
    content {
      approve_after_days = approval_rule.value.approve_after_days
      compliance_level   = approval_rule.value.compliance_level

      dynamic "patch_filter" {
        for_each = approval_rule.value.patch_filter
        content {
          key    = patch_filter.value.key
          values = patch_filter.value.values
        }
      }
    }
  }
}
