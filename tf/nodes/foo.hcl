terraform {
  source = "/opt/tf//modules/foo/"
}

locals {
  env             = read_terragrunt_config(find_in_parent_folders("environment.hcl"))
  environment     = local.env.locals.environment
  non_existent    = local.env.locals.non_existent
}

inputs = {
  environment = local.environment
  non_existent = local.non_existent
}
