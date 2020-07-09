# Upgrade Chocolatey itself
choco upgrade -y chocolatey

# Upgrade PHP and Composer
choco upgrade -y php
composer self-update

# Upgrade Node.js and NPM
choco upgrade -y nodejs-lts
npm update -g npm

# Upgrade Dart and Flutter
choco upgrade -y dart-sdk
flutter upgrade

# Upgrade Rust
choco upgrade -y rustup.install
rustup update

# Upgrade Others
choco upgrade -y python ruby golang
