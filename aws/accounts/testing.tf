resource "aws_organizations_account" "testing" {
  count                      = "${contains(var.accounts_enabled, "testing") == true ? 1 : 0}"
  name                       = "testing"
  email                      = "${format(var.account_email, "testing")}"
  iam_user_access_to_billing = "${var.account_iam_user_access_to_billing}"
  role_name                  = "${var.account_role_name}"
}

output "testing_account_arn" {
  value = "${join("", aws_organizations_account.testing.*.arn)}"
}

output "testing_account_id" {
  value = "${join("", aws_organizations_account.testing.*.id)}"
}

output "testing_organization_account_access_role" {
  value = "arn:aws:iam::${join("", aws_organizations_account.testing.*.id)}:role/OrganizationAccountAccessRole"
}
