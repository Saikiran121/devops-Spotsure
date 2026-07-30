output "asg_name" {
  value = aws_autoscaling_group.app.name
}

output "launch_template_id" {
  value = aws_launch_template.app.id
}

output "instance_role_arn" {
  value = aws_iam_role.instance.arn
}
