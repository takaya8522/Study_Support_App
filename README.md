## StudySupport  
https://study-support-app.jp/  
(アプリ内のページ下部にて、ゲストログインが可能です。)
<br>

![トップページ](app/assets/images/top_page.png "top_page.png")

[![Status](https://img.shields.io/badge/status-stable-blue.svg)](https://github.com/takaya8522/Study_Support_App/tree/main)
[![License](https://img.shields.io/badge/License-MIT%20or%20Apache%202-green.svg)](https://github.com/takaya8522/Study_Support_App/tree/main)
[![Release](https://img.shields.io/github/v/release/takaya8522/Study_Support_App.svg?maxAge=3600&label=download)](https://github.com/takaya8522/Study_Support_App/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/takaya8522/Study_Support_App/total?style=flat-square)](https://github.com/takaya8522/Study_Support_App/releases/latest)
[![Stars](https://img.shields.io/github/stars/takaya8522/Study_Support_App.svg?style=social&label=Stars)](https://github.com/takaya8522/Study_Support_App/stargazers)

[![Last Commit](https://img.shields.io/github/last-commit/takaya8522/Study_Support_App.svg)](https://github.com/takaya8522/Study_Support_App/commits)
[![Issues Open](https://img.shields.io/github/issues/takaya8522/Study_Support_App.svg)](https://github.com/takaya8522/Study_Support_App/issues)
[![Issues Closed](https://img.shields.io/github/issues-closed/takaya8522/Study_Support_App.svg)](https://github.com/takaya8522/Study_Support_App/issues?q=is%3Aissue+is%3Aclosed)
[![Code Size](https://img.shields.io/github/languages/code-size/takaya8522/Study_Support_App.svg)](https://github.com/takaya8522/Study_Support_App)
[![Repo Size](https://img.shields.io/github/repo-size/takaya8522/Study_Support_App.svg)](https://github.com/takaya8522/Study_Support_App)


<br>

## 製品概要 / Overview
プログラミングを勉強してみると覚えることが多すぎて大変！少しでも効率的に勉強をしたい！  
そんなプログラミングスクール同期生の悩みを解決したい！という一心で「StudySupport」を開発しました。  
このアプリはただのタスク管理アプリではありません！
忘却曲線に基き、自分に最も最適なオリジナルのスケジュールを自動で作成することができます。  
また、どれだけ効率的に学習を進めることが出来るかを表す忘却率を、グラフで見ることも出来ます。  

## 開発言語 / Language
- OS: Linux
- Back End: Ruby 3.0.1, Ruby on Rails 6.1.7 ( Puma ), Nginx
- Front End: HTML, CSS, JavaScript(JQuery), UIkit
- Infra: Docker, Docker-Compose, AWS ( EC2, VPC, IAM, RDS, ALB, Route53, S3 )
- DB: PostgreSQL

## 主要Gem / Main Gems
- devise :ログイン機能 / ゲストログイン機能
- ransack :検索機能
- chartkick :グラフ機能
- cancancan :管理者権限
- kaminari :ページネーション 
- rspec / factory_bot_rails :テストフレームワーク
- mini_magick / aws-sdk-s3 :画像アップロード
- rubocop / erb_lint :Lintツール

## インフラ図 / Infrastructure
使用ソフト: draw.io  
![インフラ図](app/assets/images/infrastructure.png "infrastructure")

## 機能 / Functions
- スケジュール・復習タイミング自動作成 / 残り時間表示機能 (Gem使用無し)
![スケジュール](app/assets/images/schedule_page.png "schedule_page")
タスクを登録すると学習タイミングが4件が自動的に登録され、スケジュールが作成されます。  
学習タイミングはorderで順番に並べるのではなく、残り時間昇順、カテゴリーは何か、現在の復習タイミングは何回目かということを順に判断し、現在のステータスによって表示させる内容に変化を付けています。  
（つまり復習完了した復習タイミングは表示させないようにしてあります。）
このように常に最新のスケジュールが自動的に作成されるため、効率的に学習を進めることができます。
<br>

- 管理者用ページ機能 (Gem使用無し)
![管理者画面](app/assets/images/admin_page.png "admin_page")
この管理者ページはadmin権限があるユーザーのみ表示できるよう設定してあります。  
登録ユーザーの一覧・ユーザーの投稿数・ユーザーの投稿一覧を閲覧、ユーザーの情報を変更（管理者権限付与可）、ユーザーの削除が可能となっています。
<br>

- 忘却率を表すグラフの自動作成機能 (chartkick) / 非同期通信で復習タイミングを登録する機能 (ajax)
![グラフ機能](app/assets/images/review_page.png "review_page")
復習した際どれだけ時間を節約できたかを表す「忘却率」をグラフで表示し、学習モチベーションを高めることができます。  
グラフは忘却率は学習タイミングを登録するごとに、新しいものに更新されます。
<br>

- UI/UX改善 (ダッシュボード実装、使い方表示用のボタン実装など)
![使い方](app/assets/images/how_to_use_page.png "how_to_use_page")
始めてアプリを使うユーザーでも簡単に使用できるように、わかりやすいダッシュボード実装しました。  
また、ページごとに使い方を表示させるボタンを設置しました。
<br>

- カテゴリーを登録する際、ページ遷移無しでCRUD機能を実行する機能 (ajax)
![カテゴリー](app/assets/images/category_page.png "category_page")
カテゴリーを登録する際、毎回ページ遷移があると操作性が落ちてしまうため、ページ遷移させずに登録をすることができます。
<br>

- レスポンシブデザイン対応 (Uikit)
![レスポンシブデザイン](app/assets/images/responsive_designs.png "responsive_designs")
通常のパソコンでの閲覧、iPad、iPhoneでの閲覧を想定し、レスポンシブなデザインに対応してあります。
<br>

## ER図 / Entity Relationship Diagram
使用ソフト: draw.io  
![ER図](app/assets/images/ER_diagram.png "ER_diagram")

## 画面遷移図 / Screen Transition Diagram
使用ソフト: draw.io  
![画面遷移図](app/assets/images/screen_transition_diagram.png "screen_transition_diagram")

## アプリの使い方 / How to use
1. 「学習記録を登録する」をクリックしてください。
1. 「カテゴリーを登録する」をクリックし、カテゴリーを登録してください。
1. 必要事項を記入して、学習記録を登録してください。  
「スケジュール」ページにて、次の学習予定一覧が自動的に作成されます。
1. 復習時間になりましたら「復習画面」をクリックし、復習登録をしてください。  
復習が4回終わると、学習完了済みとして登録されます。

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

## 今後実装したいもの / My plans
- Github Actionsを使ったCI/CD実装
- デプロイ先をEC2からFargateへ移行
- UIkitだとコードの可読性や拡張性が悪い、Reactを実装して改善できないか
- 友達登録機能（他のユーザーの投稿を見れるようにする）追加
