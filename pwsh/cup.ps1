# Upgrade Chocolatey itself
choco upgrade -y chocolatey

# Upgrade PHP and Composer
choco upgrade -y php
composer self-update

# Upgrade Node.js, NPM, Yarn and Deno
choco upgrade -y nodejs-lts yarn deno
npm update -g npm

# Upgrade Dart and Flutter
choco upgrade -y dart-sdk
flutter upgrade

# Upgrade Rust
choco upgrade -y rustup.install
rustup update

# Upgrade Others
choco upgrade -y python python2 ruby golang julia dotnetcore-sdk
