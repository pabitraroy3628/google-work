resource "googleworkspace_group" "web_and_mobile" {
  email = "web-and-mobile@hy-vee.com"
  name  = "Web And Mobile Teams"
}

# Add this group to the Security Groups for kubernetes access
resource "googleworkspace_group_member" "web-and-mobile_security_group" {
  group_id = googleworkspace_group.gke_security_groups.id

  email = "web-and-mobile@hy-vee.com"
  role  = "MEMBER"
  type  = "GROUP"
}

resource "googleworkspace_group_members" "web_and_mobile" {

  group_id = googleworkspace_group.web_and_mobile.id

  members {
    email = "alex.johnson@hy-vee.com"
    role  = "MEMBER"
  }

  members {
    email = "breaking-changes@hy-vee.com"
    role  = "MEMBER"
    type  = "GROUP"
  }
