# Terragrunt HCL Validate Exit Code Repro

https://github.com/gruntwork-io/terragrunt/issues/4211

```
$ make build
$ make shell
root@3080fdf36af8:/opt/tf# terragrunt hcl validate --strict-mode
╷
│ Error: Unsupported attribute
│
│   on /opt/tf/nodes/foo.hcl line 10, in locals:
│   10:   non_existent    = local.env.locals.non_existent
│     ├────────────────
│     │ local.env.locals is object with 2 attributes
│
│ This object does not have an attribute named "non_existent".
╵
root@3080fdf36af8:/opt/tf# echo $?
0
```
