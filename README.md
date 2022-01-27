[![Build and publish docker image](https://github.com/joelazar/wtfd/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/joelazar/wtfd/actions/workflows/docker-publish.yml)

# WTFD - What The Fork Dude

A ~~lightweight~~ bloated docker image, which was meant for doing quick actions in a k8s cluster. I usually use it for doing some investigations, so the name was supposed to reflect that:

![](https://media.giphy.com/media/3o6fJ8baw3aDgUQnJu/giphy.gif)

## Usage with k8s

### Start container

```
kubectl run -it wtfd --image=joelazar/wtfd:latest
```

### Jump back to it

```
kubectl exec -it wtfd -- fish
```

### Delete it, when it served it purpose

```
kubectl delete pod wtfd
```

## Usage with docker

### Start container

```
docker run -it --detach --name wtfd joelazar/wtfd:latest
```

### Jump back to it

```
docker exec -it wtfd fish
```

### Delete it, when it served it purpose

```
docker rm -fv wtfd
```

## Content

This container is built on latest arch image with an AUR helper ([yay](https://github.com/Jguer/yay)), and some extra packages, for example:

- [dog](https://github.com/ogham/dog)
- [neovim](https://github.com/neovim/neovim)
- [nnn](https://github.com/jarun/nnn)
- [pgcli](https://github.com/dbcli/pgcli)
- [tcpdump](https://www.tcpdump.org/)
- [termshark](https://github.com/gcla/termshark)
- [tmux](https://github.com/tmux/tmux)

For a complete list take a look into the [Dockerfile](./Dockerfile).

And of course you can install other packages with the following command:

```
sudo -u aur yay -S $PACKAGENAME
```

This image gets built every day, so the latest tag will always contain the latest available packages.
