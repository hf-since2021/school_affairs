# アプリケーション名
校務支援システム

# アプリケーション概要
生徒情報・教職員情報を管理することができる。
教職員情報に基づいて業務効率化・情報共有を支援する。
欠席連絡システムと連携して出欠席確認を効率化する。

# URL
https://school-affairs-808.herokuapp.com/

# テスト用アカウント
### Basic認証
- ユーザー名:test
- パスワード:basic-pass

### アカウント(システム上)
- ログインID:admin
- パスワード:test1234

# 利用方法
## ログイン機能
1. ログインIDとパスワードでログインする。
1. 管理者権限のあるユーザーは操作できる年度・学期を指定できる。
1. 管理者以外のユーザーはアクティブになっている年度・学期で自動的にログインされる。

## ユーザー管理機能
1. 管理者はユーザーを作成・編集することができる。
1. ユーザーの権限を付与することで操作範囲を限定することができる。

## 教員管理機能
1. 教員情報を作成・編集ができる。
1. 教員の基本的な情報（年度に依存しない情報）として氏名と担当教科を登録する。
1. 年度ごとの情報としては、職名、校務分掌、校務分掌における役割、担当学年・学級を登録する。
1. 教員情報はシステムのユーザーと独立して作成することができ、ユーザーと紐づけることもできる。

# アプリケーションを作成した背景
中等教育機関で導入されている校務支援系のシステムは、主としてデータベース・帳票作成の機能がメインである。教員の記録保存としての業務の一つとして生徒の出欠席があり、その一次情報は保護者からの欠席連絡にあたる。校務支援システムが、この欠席連絡を取得し、教員による出欠確認を補助し、記録させることができれば日々の業務の一部を効率化できると考えて当該機能を備えた校務支援システムを実装したいと考えた。この機能により、担任と授業担当者による二元管理に由来する業務の煩雑化も解消できる。

また、教員の業務は担当学年や校務分掌に依る部分が多いため、データベースに登録されたユーザー（教員）の情報に基づいて、情報共有や業務引継ぎなどを効率化する機能を実装したいと考えた。登録されたデータを記録の保管・帳票作成だけでなく、教員の業務を支援するために機能させるシステムを提供する。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1FIugrEl5pkOXh_1QvyNqqzWHN220BUFUY8yNClP_jso/edit?usp=sharing

# 実装した機能についての画像やGIFおよびその説明
### ユーザー管理機能
ユーザーに権限を付与して操作を制限できる。またログイン時に操作できる年度学期をユーザーに付与して（管理者は選択できる）、操作できる年度や学期の情報を制限できる。
[![Image from Gyazo](https://i.gyazo.com/4eb2fff8685b14a5543d36694747d512.gif)](https://gyazo.com/4eb2fff8685b14a5543d36694747d512)

[![Image from Gyazo](https://i.gyazo.com/e670ec4778fe5309278f1a9cc3f0d005.gif)](https://gyazo.com/e670ec4778fe5309278f1a9cc3f0d005)

### プロジェクト管理機能
ライブラリ「Frappe Gantt」を使用してプロジェクトをガントチャートで管理できる。
[![Image from Gyazo](https://i.gyazo.com/00572d7f731f4126b7acefbbe34aa5e9.gif)](https://gyazo.com/00572d7f731f4126b7acefbbe34aa5e9)

[![Image from Gyazo](https://i.gyazo.com/5411d8498490c1472a88cee624b77344.gif)](https://gyazo.com/5411d8498490c1472a88cee624b77344)

### 生徒情報管理機能
ライブラリ「Jspreadsheet CE」を使用してクラス編成をエクセル風に編集できる。
[![Image from Gyazo](https://i.gyazo.com/ec7256b906bc7fc670ace00db5b8d67d.gif)](https://gyazo.com/ec7256b906bc7fc670ace00db5b8d67d)
[![Image from Gyazo](https://i.gyazo.com/dbd0a85b37f684bfeb379d019545e9fc.gif)](https://gyazo.com/dbd0a85b37f684bfeb379d019545e9fc)

### 欠席連絡システム連携機能
欠席連絡システムとAPI連携して、保護者からの欠席連絡を取得することができる。
[![Image from Gyazo](https://i.gyazo.com/2270aeb1dbd073fb3f2b18e7ca804023.gif)](https://gyazo.com/2270aeb1dbd073fb3f2b18e7ca804023)

### マスタ管理機能
運用に合わせて各種マスタを設定できる。
<img width="1400" alt="Master_Maintenance" src="https://user-images.githubusercontent.com/96673523/172182349-8b0a0ea9-46e5-4cef-9f36-3a44a675414b.png">

# 実装予定の機能
- ホワイトボード機能
- プロジェクト管理機能
- 学籍情報管理機能
- クラス編成管理機能
- 次年度入学者処理機能
- 進級確定処理機能
- 授業管理機能
- 受講生管理機能
- 行事予定管理機能
- 時間割管理機能
- 欠席連絡取得機能
- 出欠席確認機能
- 成績入力機能
- 帳票出力機能
- CSV入出力機能

# データベース設計
![ER図](https://user-images.githubusercontent.com/96673523/172152773-8939535e-b1c9-432f-949a-071da805a34c.png)

# 画面遷移図
![画面遷移図](https://user-images.githubusercontent.com/96673523/172152902-530c0c9f-56cd-4861-acdf-c649a821762e.png)

# 開発環境
- macOS Monterey
- MySQL 8.0.28
- Ruby 2.6.5
- Ruby on Rails 6.0.5
- Node.js 14.19.1

# ローカルでの動作方法
以下のコマンドを順に実行
```
git clone https://github.com/hf-since2021/school_affairs.git
cd school_affairs
bundle install
yarn install
echo "export MYSQL80_ROOT_PASSWORD='(MYSQLのrootアカウントのパスワード)'" >> ~/.zshrc
source ~/.zshrc
rails db:create
rails db:migrate
rails s
```

# 工夫したポイント
- 当システムは、多くの学校現場で要請されるオンプレミスでの運用を想定している。クラウドサーバーで運用するされる欠席連絡システムとAPIで連携することで課題解決を実現する。また、欠席連絡システムへのリクエストをコントローラに記述することで、Linuxなどのスケジューラから定期実行できるようにした。
- ログインする年度・学期をusersテーブルのユーザー当人のレコードに保存し、操作の際に参照することでログイン先＝操作範囲の限定を実現した。
- 操作性を高めるためにガントチャートやスプレッドシートデザインを採用した。また、ドロワーメニューを採用することで画面を広く使えるようにした。
