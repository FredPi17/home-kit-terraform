# HomeKit terraform

Ce projet est crée pour déployer les services homekit et supervision avec terraform. 

## Préparation 

* Avoir terraform d'installé
* Vérifier les disponibilités des machines sur le réseau pour déployer l'infra 
* Avoir sa clé SSH d'ajouté dans les known_hosts des machines sur le réseau 

## Déploiement

1. Aller dans le répertoire `terraform/`
2. Puis exécuter `terraform init` 
3. Et exécuter `terraform apply`