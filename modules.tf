module "network" {
    source = "./modules/network"
}

module "ec2" {
    source = "./modules/ec2"
    private_subnet_id = module.network.private_subnet_id
}