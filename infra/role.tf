resource "aws_iam_role" "beanstalk_role" {
  name = "beanstalk_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy" "beanstalk_policy" {
  name = "beanstalk_policy"
  role = aws_iam_role.beanstalk_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
            "cloudformation:DescribeStackResource",
            "cloudformation:DescribeStackResources",
            "cloudformation:DescribeStacks",
            "autoscaling:DescribeAutoScalingGroups",
            "autoscaling:DescribeAutoScalingInstances",
            "autoscaling:DescribeNotificationConfigurations",
            "autoscaling:DescribeScalingActivities",
            "autoscaling:PutNotificationConfiguration",
            "ec2:DescribeInstanceStatus",
            "ec2:AssociateAddress",
            "ec2:DescribeAddresses",
            "ec2:DescribeInstances",
            "ec2:DescribeSecurityGroups",
            "elasticloadbalancing:DescribeInstanceHealth",
            "elasticloadbalancing:DescribeLoadBalancers",
            "elasticloadbalancing:DescribeTargetHealth",
            "elasticloadbalancing:DescribeTargetGroups",
            "lambda:GetFunction",
            "sqs:GetQueueAttributes",
            "sqs:GetQueueUrl",
            "sns:Publish",
            "logs:*",
            "s3:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_instance_profile" "beanstalk_profile" {
  name = "beanstalk_profile"
  role = aws_iam_role.beanstalk_role.name
}