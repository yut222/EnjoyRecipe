source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.7', '>= 6.1.7.2'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 3.11'  # デプロイでバージョンを変更
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
gem 'image_processing', '~> 1.2'  #コメントアウトを外す

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  # gem 'capybara', '>= 3.26'
  # gem 'selenium-webdriver', '>= 4.0.0.rc1'
  # # Easy installation and use of web drivers to run system tests with browsers
  # gem 'webdrivers'
  # Rspec導入
  gem 'capybara', '>= 2.15'
  gem 'rspec-rails'
  gem "factory_bot_rails"
  gem 'faker'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'devise'
# deviseをdevise-i18nを使って多言語化
gem 'devise-i18n'
# devise用のbootstrapを追加
gem 'devise-bootstrap-views', '~> 1.0'

# ページネーション
gem 'kaminari','~> 1.2.1'

# 検索フォーム
gem 'ransack'

#画像アップロード
gem 'carrierwave'

#画像のリサイズ
gem 'mini_magick'

# キーを環境変数化
gem 'dotenv-rails'
gem 'fog-aws'

# PV数の実装
gem 'impressionist', '~>1.6.1'

# 多言語化の導入
gem 'rails-i18n', '~> 6.0.0'

# 各モデルのスキーマ情報をコメントとして書き出してくれる
gem 'annotate'

# アイコンを重ねて表示する
gem 'font-awesome-sass'

gem 'better_errors'  # デフォルトのエラー画面をわかりやすく整形
gem 'binding_of_caller'  # better_errorsと一緒に使うことで、ブラウザ上でirbを使えるようになる

# 書いたコードを良い書き方に指摘してくれる
gem 'rubocop', require: false
gem 'rubocop-performance', require: false
gem 'rubocop-rails', require: false

gem 'cocoon'

# pryはirbの「強化版」
gem 'pry-rails'

# Rspec導入
gem 'net-smtp'

# wheneverでcron設定
gem 'whenever', require: false

# デプロイ
gem 'dotenv-rails'
group :production do
  gem 'mysql2'
end

gem "net-smtp"
gem "net-pop"
gem "net-imap"