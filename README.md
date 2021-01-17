## simplePoker

---

<img width="1440" alt="スクリーンショット 2021-01-03 13 47 16" src="https://user-images.githubusercontent.com/50585862/103471941-559cbd00-4dca-11eb-84da-bb521cf18985.png">

ポーカーゲームです。  
コンピューターと役の強さを競います。  
プレーするために、ユーザー登録、ログインが必要です。

- テストユーザ用のアカウントです。
  - email: test@test.com
  - password: hogehoge

## アプリの概要

- 名称: simplePoker
- site: https://simple-poker-jw.herokuapp.com/
- 目的: ruby 2.6、rails 6.0 を使用した web アプリを作成する。  
   　　 view 内で javascript を使用した 動的な動きを実装する。
- 設計: nginx を web サーバー,unicorn を AP サーバーとした。

## 操作方法

1. トップページの「sign up」ボタンからユーザー登録ページへ遷移。
2. 登録ページの必要事項を入力し、「sign up」を押下。
3. 登録後、ログインページへ遷移し、先ほど登録したメールアドレスとパスワードを入力。「login」ボタンを押下。
4. ログインが成功すれば、user ページに遷移します。header 「simplePoker」を押下するとゲームが開始されます。

5. カードの交換は一度のみです。
6. 場に残したいカードは、カードをクリックすることで hold されます。
7. 「play」ボタンを押すと result ページに遷移し、勝敗が決します。
8. 「replay」ボタンを押下すれば、再度勝負が始まります。

## 使用した技術

- ruby on Rails 6.0
- ruby 2.6.5
- javascript
- sass
- mysql 8.0
- nginx
- Rspec
- Capybara
- Factory bot
- unicorn
- heroku
- docker
- docker-compose

## ページビュー

<img width="1440" alt="スクリーンショット 2021-01-03 13 47 31" src="https://user-images.githubusercontent.com/50585862/103471950-6e0cd780-4dca-11eb-8870-48ede128a81b.png">
<img width="1440" alt="スクリーンショット 2021-01-03 13 47 53" src="https://user-images.githubusercontent.com/50585862/103471951-6f3e0480-4dca-11eb-8eca-ead55e881726.png">

## 設計

こだわったポイント 😀  
責務ごとにクラスを分割し、 オブジェクト指向を意識して設計しました。  
<img width="1440" alt="スクリーンショット 2021-01-17 11 00 01" src="https://user-images.githubusercontent.com/50585862/104829062-3b2b0f00-58b3-11eb-993d-fb2ed22ccda5.png">  
<img width="1440" alt="スクリーンショット 2021-01-17 10 59 53" src="https://user-images.githubusercontent.com/50585862/104829064-3d8d6900-58b3-11eb-99c2-4b852ec1c268.png">

## ER 図

<img width="1440" alt="スクリーンショット 2021-01-03 16 37 04" src="https://user-images.githubusercontent.com/50585862/103473965-fc408800-4de1-11eb-9dc3-4629090b5afd.png">

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
