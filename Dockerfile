#
# Dockerfile for Arch with yaourt installed
FROM base/archlinux:latest
MAINTAINER Jev Bjorsell, @jevonearth

RUN sed 's/^CheckSpace/#CheckSpace/g' -i /etc/pacman.conf
RUN pacman --quiet --noconfirm -Sy archlinux-keyring
RUN pacman --quiet --noconfirm -S base-devel \
  && pacman-db-upgrade

RUN echo '[archlinuxfr]' >> /etc/pacman.conf \
 && echo 'SigLevel = Never' >> /etc/pacman.conf \
 && echo 'Server = http://repo.archlinux.fr/$arch' >> /etc/pacman.conf \
 && pacman -Sy
