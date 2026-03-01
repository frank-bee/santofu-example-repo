# Santofu Example Repo

Example Terraform/OpenTofu repository for trying out [Santofu](https://github.com/frank-bee/santofu) — an MCP server that runs OpenTofu on Kubernetes.

## What's inside

```
santofu.yaml              # Project config (lists the stacks below)
stacks/local-demo/
  main.tf                 # local_file + null_resource (no cloud creds needed)
```

Two projects are defined in `santofu.yaml`:

| Project | Directory | Workspace |
|---------|-----------|-----------|
| `local-demo` | `stacks/local-demo` | default |
| `local-demo-staging` | `stacks/local-demo` | staging |

## Usage

1. **Fork** this repo and clone your fork
2. **Start Santofu** pointing at your clone (see the [Santofu Quick Start](https://github.com/frank-bee/santofu#quick-start))
3. **Try it**: ask your MCP client to `list projects`, `plan local-demo`, `apply local-demo`

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0)
