terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "greeting" {
  description = "A greeting message to write to the file"
  type        = string
  default     = "Hello from Santofu! (v2)"
}

resource "local_file" "hello" {
  content  = "${var.greeting}\nEnvironment: ${var.environment}\nManaged by: Santofu MCP Server\n"
  filename = "${path.module}/output/hello.txt"
}

resource "null_resource" "example" {
  triggers = {
    greeting = var.greeting
  }

  provisioner "local-exec" {
    command = "echo 'Provisioned in ${var.environment} environment'"
  }
}

resource "local_file" "info" {
  content  = "Version: v2\nTimestamp: managed by Santofu\n"
  filename = "${path.module}/output/info.txt"
}

output "file_path" {
  description = "Path to the generated file"
  value       = local_file.hello.filename
}

output "file_content" {
  description = "Content of the generated file"
  value       = local_file.hello.content
}

output "environment" {
  description = "Current environment"
  value       = var.environment
}
