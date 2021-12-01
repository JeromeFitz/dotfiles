alias d='docker $*'
alias d-c='docker-compose $*'

# # Docker
# alias docker_remove_images='docker rmi $(docker images -a -q)'
# alias docker_clean_env='docker_remove_images && docker_clean_ps'

# # Docker
# dm-env() { eval "$(docker-machine env "${1:-default}")" }
# docker-clean() { docker rmi -f $(docker images -q -a -f dangling=true) }

# # Stop all containers
# dstop() { docker stop `docker ps -aq` }

# # Remove all containers
# drm() { docker rm $(docker ps -a -q); }

# # Stop and Remove all containers
# alias drmf='dstop && drm'

# # Remove all images
# dri() { docker rmi $(docker images -q); }

# # Remove all Volumes
# dvrm() { docker volume rm $(docker volume ls -qf dangling=true) }
