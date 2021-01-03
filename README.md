## golfersfarm

---

ゴルファーのプロフィール登録ツールです。  
このアプリはゴルファーの名刺として使えます。
レスポンシブル対応なので、スマホ画面でも問題ありません。  
現在、production 版として、本アプリの next.js 化を行っています。  
[こちらが完成版です 😀](https://golfersfarm.com/)

<img width="1433" alt="スクリーンショット 2020-12-03 16 46 28" src="https://user-images.githubusercontent.com/50585862/100980654-eba1b580-3588-11eb-956e-f387b9ff458b.png">

## アプリの概要

- 名称: golfersfarm
- site: https://golfersfarm.netlify.app/
- 目的: typescript にてアプリケーションを開発した実績を作る。フロントエンドとバックエンドが分離したモダンな開発を経験する。
- 設計:
  - フロント側：redux にて状態を管理。バックエンドとの通信には、redux-saga,axios を使用。
  - バックエンド側: express にて API を作成。jwt を活用し、secure な開発を心がけた。
  - 全体: docker-compose を使用し、client,server,db コンテナを稼働させ開発を行った。
- 背景: コロナ禍において、ゴルフは三密を回避するスポーツとして、今、見直されてきています。 また、リモートワークの推進により、余暇時間が増え、そして、都心から地方へ居を移す動きが増加した場合、ゴルフを始めるというニーズは増えていくと予想されます。従来、事前にメンバーを集めることがゴルフの常識でしたが、今後はちょっと空いた時間を利用した一人ゴルフが増えていくのではないかと思料されます。その際に、名刺代わりに使用するツールとして作成しました。

## 使用した技術

フロントエンド

- react
- react-router
- connected-react-router
- react-modal
- react-toastify
- redux,react-redux
- redux-saga
- axios
- formik
- yup
- typescript
- eslint+prettier
- styled-components
- netlify
- ansible

バックエンド

- express
- bcrypt
- passport
- passport-jwt
- passport-local
- sequelize
- multer
- sharp
- mysql2
- typescript
- heroku
- ansible

## 設計

### 全体構成

![image](https://user-images.githubusercontent.com/50585862/101127024-fd925f80-363f-11eb-89cb-bfc76ee8b008.png)

### 認証

![image](https://user-images.githubusercontent.com/50585862/101127020-f8cdab80-363f-11eb-9d99-c8e36132729b.png)

#### jwtToken にて認証。ブラウザの localStorage にて Token を管理。

1.  クライアントのログインページにて、サーバー側にログインリクエスト。
2.  リクエストが、認証されれば、server から jwtToken が送られる。
3.  送られてきた jwtToken をブラウザの localStorage に保存。
4.  以降、API リクエストごとに認証。
5.  リダイレクトした場合、localStorage に jwtToken があれば、自動的にログインされる。

### フロントエンド(ページ構成)

| NO  | PATH            | EXPLANATION        | REMARKS |
| --- | --------------- | ------------------ | ------- |
| 1   | /               | トップ             |
| 2   | /users          | ユーザー一覧       |
| 3   | /users/:id      | ユーザー詳細       |
| 4   | /users/:id/edit | ユーザーデータ編集 |
| 5   | /auth/signup    | ユーザー登録       |
| 6   | /auth/login     | ユーザーログイン   |
| 7   | /auth/logout    | ログアウト         |
| 8   | /privacy        | 個人情報の取扱い   |
| 9   | /tos            | 利用規約           |
| 10  | /about          | アプリ説明         |
| 11  | /contact        | 問合せフォーム     |

/users  
<img width="300" alt="スクリーンショット 2020-12-03 16 50 17" src="https://user-images.githubusercontent.com/50585862/100980871-42a78a80-3589-11eb-96c2-72d53a10f9db.png">  
/users/:id  
<img width="300" alt="スクリーンショット 2020-12-03 16 50 33" src="https://user-images.githubusercontent.com/50585862/100980883-476c3e80-3589-11eb-8d91-5c89a134fda9.png">

### API エンドポイント

![image](https://user-images.githubusercontent.com/50585862/101126959-e0f62780-363f-11eb-87fa-631325cfc5a1.png)

/auth

| NO  | METHOD | PATH    | EXPLANATION      | REMARKS          |
| --- | ------ | ------- | ---------------- | ---------------- |
| 1   | POST   | /signup | ユーザー新規作成 |
| 2   | POST   | /login  | ユーザーログイン |
| 3   | GET    | /login  | ユーザーログイン | 初期リクエスト時 |

/users

| NO  | METHOD | PATH                 | EXPLANATION                                  | REMARKS |
| --- | ------ | -------------------- | -------------------------------------------- | ------- |
| 1   | GET    | /                    | ユーザー一覧取得                             |
| 2   | PATCH  | /:id/edit            | ユーザーデータ更新                           |
| 3   | GET    | /:id/ball            | ユーザー使用ボールの取得                     |
| 4   | PATCH  | /:id/ball            | ユーザー使用ボールの更新                     |
| 5   | GET    | /:id/clubs           | ユーザー使用クラブの取得                     |
| 6   | POST   | /:id/clubs/replace   | ユーザー使用クラブの作成、更新、削除         |
| 7   | GET    | /:id/videos          | ユーザー youtube 動画の URL 取得             |
| 8   | POST   | /:id/videos/replace  | ユーザー youtube 動画 URL の作成、更新、削除 |
| 9   | GET    | /:id/results         | ユーザー競技結果の取得                       |
| 10  | POST   | /:id/results/replace | ユーザー競技結果の作成、更新、削除           |

※ユーザー個人データのエンドポイントはありません。ユーザー一覧から取得したデータを元にフロント側で処理します。  
other

| NO  | METHOD | PATH     | EXPLANATION                    | REMARKS      |
| --- | ------ | -------- | ------------------------------ | ------------ |
| 1   | GET    | /makers  | メーカー一覧取得               | 初期データ   |
| 2   | GET    | /shafts  | ゴルフクラブのシャフト一覧取得 | 　初期データ |
| 3   | GET    | /types   | ゴルフクラブの番手一覧取得     | 初期データ   |
| 4   | POST   | /contact | 問合せ内容をメールで送信       |
