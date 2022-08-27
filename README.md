# RoRSample01
Twitter風

- Rubyバージョン
3.1.2

- Railsバージョン
7.0.3

---
## 環境構築

```
rbenv local 3.1.2
bundle init
```

- Gemfile編集

```
gem "rails", "~> 7.0.3"
```

- ディレクトリ配下のvendor/bundleにgemを入れる

```
bundle install --path vendor/bundle
```

- bundle installしない

```
bundle exec rails new . --skip-bundle --skip-test --skip-coffee
bundle install
```

- Gemfile編集
  - 日本語化
  - パスワード暗号化用（ハッシュ関数）

```
gem 'rails-i18n'
gem 'bcrypt'
```

```
bundle install
```

- 日本語化
config/application.rb編集

```
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
```


---
## 雛形作成

- ユーザ作成

model, controller作成

```
bundle exec rails g resource User name:string email:string:uniq password_digest:string
```

- 投稿

model, controller作成

```
bundle exec rails g resource Post user:references title:string comment:string
```

- DB作成

```
bundle exec rails db:migrate
```

- ユーザモデル編集

app/models/user.rb

- ユーザコントローラ編集

app/controllers/users_controller.rb

- ユーザフォーム作成

app/views/users/_form.html.erb  
app/views/users/edit.html.erb  
app/views/users/new.html.erb  
app/views/users/show.html.erb

- 投稿モデル編集

app/models/post.rb

- 投稿コントローラ編集

app/controllers/posts_controller.rb

- 投稿フォーム作成	

app/views/posts/_form.html.erb  
app/views/posts/edit.html.erb  
app/views/posts/index.html.erb  
app/views/posts/new.html.erb

---
## ログイン機能

```
bundle exec rails g controller Sessions new
```

app/controllers/sessions_controller.rb編集
app/helpers/sessions_helper.rb編集
app/views/sessions/new.html.erb編集

config/routes.rb編集

```
  root 'posts#index'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users do
    resources :posts
  end
```

## 共通ヘッダ
app/views/layouts/_header.html.erb

## Bootstrap読み込み、共通ヘッダ読み込み
app/views/layouts/application.html.erb


app/controllers/application_controller.rb
