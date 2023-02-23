module "oauth2_provider" {
    source = "../../infra"

    nome = "oauth2-provider"
    regiao_aws = "sa-east-1"
    maquina = "t2.micro"
    max_instances = 4
    chaveSSH = "chave_ssh"
}

output "DNSBeanstalk-oauth2-provider" {
    value = module.oauth2_provider.DNSBeanstalk
}
