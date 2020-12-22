# Metasploit Framework installer for Arch Linux ARM
# https://github.com/Pernat1y/msfinstall-arch-arm

# Check user
if [[ "$EUID" -ne 0 ]]; then
    echo 'Must be root. Exiting.'; exit
fi

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
rm -rf "/opt/metasploit-framework" 2>/dev/null
git clone https://github.com/rapid7/metasploit-framework.git
cd "/opt/metasploit-framework"

# Install gems
CFLAGS+=" -I/usr/include/libxml2"
bundle config set no-cache 'true'
bundle config set deployment 'true'
bundle install -j"$(nproc)"

# Cleanup
rm /opt/metasploit-framework/msfupdate 2>/dev/null

# Add this to profile to make changes permanent
PATH=$PATH:/opt/metasploit-framework

