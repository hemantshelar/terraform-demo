

resource "azuread_user" "devuser" {
  user_principal_name = "${var.env}${var.tla}@NETORGFT17726763.onmicrosoft.com"
  display_name        = "${var.env}${var.tla}"
  mail_nickname       = "${var.env}${var.tla}"
  password            = "P@ssw0rd1234!"  # Ensure you follow your organization's password policy
}

resource "azuread_group" "devcontributors" {
  display_name = "${var.env}contributors"
  mail_enabled = false
  security_enabled = true
}

resource "azuread_group_member" "devusermember" {
  group_object_id = azuread_group.devcontributors.object_id
  member_object_id = azuread_user.devuser.object_id
}