## README
Study Support仮
url: https://xxx.com/

## 製品概要 / Overview
中級者の壁を突破するには1000時間費やす必要があるという法則があります。
しかし、1000時間を勉強に使うというのはとても大変なことです。
Study Supportは自分が努力してきた過程を可視化し、効率的に勉強を進められるよう
サポートし、あなたのモチベーションを維持するお手伝いをします。

## 開発言語 / Language
- OS: Linux
- Back End: Ruby 3.0.1, Ruby on Rails 6.1.7 ( Puma ), Nginx
- Front End: HTML, CSS, JavaScript, jQuery, Bootstrap, Vue.js
- Infra: Docker, Docker-Compose, AWS ( EC2, VPC, IAM, RDS, Route53, CloudFormation, S3, CodeDeploy, ChatBot ), CircleCI
- DB: PostgreSQL

## 機能・使用Gem / Functions・Gem
- devise
- rails_admin
- cancancan
- rexml
- devise-i18n
- ransack
- kaminari 
- Chartkickを使ったグラフ作成機能
- OAuth認証によるTwitterとの連携機能
- AWS/Docker/CircleCIを組み込んだインフラ構成

## 実行手順
```
$ git clone git@github.com:takaya8522/learning_management_app.git
$ cd learning_management_app
$ bundle install
$ rails db:create && rails db:migrate
$ rails s
```

## カタログ設計
https://docs.google.com/spreadsheets/d/1OJsO9URVHPh7UKNb_cOECq93J4ENs1RVijoAgtxrYYw/edit?usp=sharing

## テーブル定義書
https://docs.google.com/spreadsheets/d/1b29pPPevHSUXrvg2q2LhTVvuOzghVa0hnVMwlwT0_KI/edit?usp=sharing

## ワイヤーフレーム

## ER図

## 画面遷移図