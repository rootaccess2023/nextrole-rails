source "https://rubygems.org"

ruby "3.3.1"

gem "rails", "~> 7.1"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "bootsnap", require: false

# Auth
gem "bcrypt", "~> 3.1.7"   # has_secure_password
gem "jwt", "~> 2.7"         # JSON Web Tokens

# Admin
gem "activeadmin"
gem "devise"
gem "sassc-rails"

# CORS
gem "rack-cors"

# Env vars
gem "dotenv-rails", groups: [:development, :test]

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
end