variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}

variable "project_name" {
  description = "Project name used for tagging and naming resources"
  type        = string
  default     = "devops-sandbox"
}
