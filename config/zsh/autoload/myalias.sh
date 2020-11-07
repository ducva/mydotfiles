#!/usr/bin/env zsh

alias vf='vifm .'

# connect resola dev
alias resola-dev='aws ssm start-session --target `aws ec2 describe-instances --filters "Name=tag:Name,Values=rebot-dev-env" --query "Reservations[*].Instances[*].{Instance:InstanceId}" --output text`'

