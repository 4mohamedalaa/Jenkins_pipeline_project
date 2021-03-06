module "network" {
  source                = "./network"
  cider                 = var.cider
  region                = var.region
  Name                  = var.Name
  public1_subnet_cider  = var.public1_subnet_cider
  public2_subnet_cider  = var.public2_subnet_cider
  private1_subnet_cider = var.private1_subnet_cider
  private2_subnet_cider = var.private2_subnet_cider
  az1                   = var.az1
  az2                   = var.az2
}
