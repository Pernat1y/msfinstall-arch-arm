# Metasploit Framework installer for Arch Linux ARM
# https://github.com/Pernat1y/msfinstall-arch-arm

# Install dependencies
pacman -Syyu \
    gcc \
    make \
    pkgconf \
    git \
    libpcap \
    libxml2 \
    libxslt \
    postgresql-libs \
    ruby \
    ruby-bundler \
    sqlite \
    ruby-pg \
    inetutils \
    --needed

# Clone repo
cd /opt
git clone https://github.com/rapid7/metasploit-framework.git
cd "metasploit-framework"

CFLAGS+=" -I/usr/include/libxml2"
bundle config set no-cache 'true'
bundle config set deployment 'true'
bundle install -j"$(nproc)"

# Add this to profile to make changes permanent
PATH=$PATH:/opt/metasploit-framework

