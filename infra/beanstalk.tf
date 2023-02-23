resource "aws_elastic_beanstalk_application" "beanstalk_app" {
  name        = "${var.nome}-app"
}

resource "aws_elastic_beanstalk_environment" "beanstalk_env" {
  name                = "${var.nome}-env"
  application         = aws_elastic_beanstalk_application.beanstalk_app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.4.4 running Python 3.8"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.maquina
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.max_instances
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.beanstalk_profile.name
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = var.chaveSSH
  }
}
