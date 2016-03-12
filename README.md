# レールズ・テンプレート (for Rails 4)
* 基本的には `rails new` の導きに従ってほしい
* `rails new --template path/to/template.rb` で発動する
* `Gemfile` は全消しして新しいのを作り直すぞ
* Turbolinks 使いたい場合は手で `turbolinks` ジェムをリクアイアーした上で `application.js` でよしなにしてくれ
* 使いたくない時は `--skip-turbolinks` だ
* `rails new` に `-d` がついてればいい感じの動きをする
* グローバルジェムを汚さない主義者は `~/.bundle/config` に `BUNDLE_PATH: ./vendor/bundle` とか書くと良い `--skip-bundle` はしないでくれ
