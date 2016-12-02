FROM pritunl/archlinux

WORKDIR /usr/local/src
COPY . /usr/local/src

RUN pacman -S haskell-stack --noconfirm && \
    stack setup && \
    stack install && \
    pacman -Rsu haskell-stack --noconfirm && \
    rm -rf /usr/local/src/.stack-work && \
    rm -rf /root/.stack && \
    rm -rf /var/cache/pacman/pkg

EXPOSE 8081

CMD ["/root/.local/bin/servant-docker"]
