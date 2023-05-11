
# IAAC REPO
this repository for infrastructure AS a code terraform consists of two servers hosted on AWS
* jenkins
* sonarqube


# PROJECT WORKFLOW
each server have init shell script executed by terraform to get the state of servers ready

to run :
> terraform plan && terraform apply

# HOW IT WORKS
it runs two EC2 instances in aws cloud provider



## future work
CaaC for jenkins

master slave archetecture to be intruduced
