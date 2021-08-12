FROM archlinux:base

# install yay
RUN echo '[multilib]' >> /etc/pacman.conf && \
    echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf && \
    pacman --noconfirm -Syyu && \
    pacman --noconfirm -S base-devel git && \
    useradd -m -r -s /bin/bash aur && \
    passwd -d aur && \
    echo 'aur ALL=(ALL) ALL' > /etc/sudoers.d/aur && \
    mkdir -p /home/aur/.gnupg && \
    echo 'standard-resolver' > /home/aur/.gnupg/dirmngr.conf && \
    chown -R aur:aur /home/aur && \
    mkdir /build && \
    chown -R aur:aur /build && \
    cd /build && \
    sudo -u aur git clone --depth 1 https://aur.archlinux.org/yay.git && \
    cd yay && \
    sudo -u aur makepkg --noconfirm -si && \
    sudo -u aur yay --afterclean --removemake --save && \
    pacman -Qtdq | xargs -r pacman --noconfirm -Rcns && \
    rm -rf /home/aur/.cache && \
    rm -rf /build

# install custom tools with yay
RUN sudo -u aur yay -Sy --noconfirm \
    bat \
    dog \
    exa \
    fd \
    fish \
    fisher \
    fzf \
    httpie \
    neovim \
    net-tools \
    nnn \
    pgcli \
    ripgrep \
    tcpdump \
    termshark \
    tmux \
    && pacman -Qtdq | xargs -r pacman --noconfirm -Rcns \
    && rm -rf /home/aur/.cache /var/cache

RUN fish -c "fisher install franciscolourenco/done jorgebucaran/hydro PatrickF1/fzf.fish"

COPY rootfs/ /

WORKDIR /root/

RUN ln -sf /usr/share/zoneinfo/Europe/Copenhagen /etc/localtime

ENTRYPOINT ["fish"]
