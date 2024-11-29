
#!/usr/bin/bash

set -eoux pipefail

# Add Staging repo
curl --retry 3 -Lo /etc/yum.repos.d/ublue-os-staging-fedora-"$(rpm -E %fedora)".repo \
    https://copr.fedorainfracloud.org/coprs/ublue-os/staging/repo/fedora-"$(rpm -E %fedora)"/ublue-os-staging-fedora-"$(rpm -E %fedora)".repo

# Add Switcheroo Repo
curl --retry 3 -Lo /etc/yum.repos.d/_copr_sentry-switcheroo-control_discrete.repo \
    https://copr.fedorainfracloud.org/coprs/sentry/switcheroo-control_discrete/repo/fedora-"$(rpm -E %fedora)"/sentry-switcheroo-control_discrete-fedora-"$(rpm -E %fedora)".repo

# Add Nerd Fonts Repo
curl --retry 3 -Lo /etc/yum.repos.d/_copr_che-nerd-fonts-"$(rpm -E %fedora)".repo https://copr.fedorainfracloud.org/coprs/che/nerd-fonts/repo/fedora-"$(rpm -E %fedora)"/che-nerd-fonts-fedora-"$(rpm -E %fedora)".repo

# 1Password
mkdir -p /var/opt
curl https://downloads.1password.com/linux/keys/1password.asc | tee /etc/pki/rpm-gpg/RPM-GPG-KEY-1password
sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=0\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-1password" > /etc/yum.repos.d/1password.repo'

# Brave Browser
curl -LsS https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo -o /etc/yum.repos.d/brave-browser.repo
curl -LsS https://brave-browser-rpm-release.s3.brave.com/brave-core.asc -o /etc/pki/rpm-gpg/brave-core.asc