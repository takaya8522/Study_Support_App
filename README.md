## README
Study Support  
url: https://study-support-app.jp/
![タイトルロゴ](app/assets/images/cover_photo.png "cover_photo.png")

## 製品概要 / Overview
中級者の壁を突破するには1000時間費やす必要があるという法則があります。  
しかし、1000時間を勉強に使うというのはとても大変なことです。  
Study Supportはエビングハウスの忘却曲線理論による、脳科学的に脳の定着率が高いと言われている勉強周期を自動的に導き出し、
あなたの学習をサポートします。
また今まで費やしてきた勉強記録をアプリに登録することにより、時間の節約率をグラフにして表すことができます。
Study Supportにより自分の努力過程を視覚的に得ることができ、あなたのモチベーションを高めることができます。

## 開発言語 / Language
- OS: Linux
- Back End: Ruby 3.0.1, Ruby on Rails 6.1.7 ( Puma ), Nginx
- Front End: HTML, CSS, JavaScript(JQuery), Uikit
- Infra: Docker, Docker-Compose, AWS ( EC2, VPC, IAM, RDS, ALB, Route53, S3 )
- DB: PostgreSQL

## 主要Gem / Main Gems
- devise :ログイン機能
- ransack :検索機能
- chartkick :グラフ機能
- cancancan :管理者権限
- kaminari :ページネーション 
- rspec/rexml/factory_bot_rails :テストフレームワーク
- mini_magick/aws-sdk-s3 :画像アップロード
- rubocop/rubocop-performance/rubocop-rails/rubocop-rspec/erb_lint :Lintツール

## 主要パッケージ / Main Packages
- Uikit(フロントフレームワーク)
- AOS(jsライブラリ)
- Lorem Picsum(画像表示API)

## 機能 / Functions
- スケジュール自動作成機能
- 復習タイミング自動作成機能
- 復習タイミングチェックシート機能
- 残りの復習までのカウントダウン表示機能
- グラフ自動作成機能
- レスポンシブデザイン対応
- AWS/Docker/RDS/ALBを取り入れたインフラ構成

## インフラ図 / Infrastructure
使用ソフト: draw.io  
![インフラ図](app/assets/images/infrastructure.png "infrastructure")

## レスポンシブデザイン / Responsive Designs
使用ソフト: Mockup Photos
![レスポンシブデザイン](app/assets/images/responsive_designs.png "responsive_designs")

## 実行手順 / Procedure
```
$ git clone git@github.com:takaya8522/learning_management_app.git
$ cd learning_management_app
$ docker-compose build --no-cache
$ docker-compose up -d
$ docker-compose exec app rails db:create && rails db:migrate
```

## カタログ設計とテーブル定義書 / Catalog Design & Table Definition
使用ソフト: Google Sheets  
https://docs.google.com/spreadsheets/d/18VkBayIlMdg-bML_hHs3Ka77BNrWWdjBx12f_PmN8MM/edit?usp=sharing

## ワイヤーフレーム / Wire frame
使用ソフト: figma  
https://www.figma.com/file/0tbZ7puai7oA7PGhsBlbHV/%E3%83%AF%E3%82%A4%E3%83%A4%E3%83%BC%E3%83%95%E3%83%AC%E3%83%BC%E3%83%A0?node-id=0%3A1

## ER図 / Entity Relationship Diagram
使用ソフト: draw.io  
![ER図](app/assets/images/ER_diagram.png "ER_diagram")

## 画面遷移図 / Screen Transition Diagram
使用ソフト: draw.io  
![画面遷移図](app/assets/images/screen_transition_diagram.png "screen_transition_diagram")
