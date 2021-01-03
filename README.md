## simplePoker

---

<img width="1440" alt="スクリーンショット 2021-01-03 13 47 16" src="https://user-images.githubusercontent.com/50585862/103471941-559cbd00-4dca-11eb-84da-bb521cf18985.png">

ポーカーゲームです。  
コンピューターと役の強さを競います。  
プレーするために、ユーザー登録、ログインが必要です。  
※アプリ立ち上げに時間がかかる場合があります 🙇‍♂️

- テストユーザ用のアカウントです。
  - email: test@test.com
  - password: test

## アプリの概要

- 名称: simplePoker
- site: https://simple-poker-jw.herokuapp.com/
- 目的: ruby 2.6、rails 6.0 を使用した web アプリを作成する。  
   　　 view 内で javascript を使用した 動的な動きを実装する。
- 設計: nginx を web サーバー,unicorn を AP サーバーとした。

## 操作方法

1. トップページの「登録する！」ボタンからユーザー登録ページへ遷移。
2. 登録ページの必要事項を入力し、「登録する！」を押下。
3. 登録後、ログインページへ遷移し、先ほど登録したメールアドレスとパスワードを入力。「ログイン！」ボタンを押下。
4. ログインが成功すれば、user ページに遷移します。header 「poker」を押下するとゲームが開始されます。

5. カードの交換は一度のみです。
6. 場に残したいカードは、カードをクリックすることで hold されます。
7. 「勝負する！」ボタンを押すと result ページに遷移し、勝敗が決します。
8. 「もう一度！」ボタンを押下すれば、再度勝負が始まります。

## 使用した技術

- ruby on Rails 6.0
- ruby 2.6.5
- javascript
- sass
- mysql 8.0
- nginx
- Rspec
- unicorn
- heroku
- docker
- docker-compose

## ページビュー

<img width="1440" alt="スクリーンショット 2021-01-03 13 47 31" src="https://user-images.githubusercontent.com/50585862/103471950-6e0cd780-4dca-11eb-8870-48ede128a81b.png">
<img width="1440" alt="スクリーンショット 2021-01-03 13 47 53" src="https://user-images.githubusercontent.com/50585862/103471951-6f3e0480-4dca-11eb-8eca-ead55e881726.png">

## ER 図

<img width="1440" alt="スクリーンショット 2021-01-03 16 37 04" src="https://user-images.githubusercontent.com/50585862/103473965-fc408800-4de1-11eb-9dc3-4629090b5afd.png">

※1 results.victory はワンペア等の役を数値型で保管  
※2 results.card は５枚のカードを数値型で保管

## ページ構成

| NO  | PATH       | EXPLANATION        | REMARKS              |
| --- | ---------- | ------------------ | -------------------- |
| 1   | /          | トップ             | ログイン後ゲーム画面 |
| 2   | /users     | ユーザー一覧       |
| 3   | /users/:id | ユーザー詳細       |
| 4   | /results   | ポーカーの結果表示 |
| 5   | /signup    | ユーザー登録       |
| 6   | /login     | ユーザーログイン   |
| 7   | /logout    | ログアウト         |
