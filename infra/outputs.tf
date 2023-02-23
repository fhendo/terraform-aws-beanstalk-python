output "DNSBeanstalk" {
    value = aws_elastic_beanstalk_environment.beanstalk_env.cname
}
