# アプリケーション内容

・アプリ名【トモイ珈琲 online shop】

・概要【jQuery、SNS認証、SNSシェア機能、ユーザー登録、購入機能、オーナー登録、オーナー出品機能、OGP機能】

・制作背景【コロナ禍の影響で巣ごもり消費が増える為、地域活性のコミュニティの場として】

・開発で苦労した事/工夫した事【一から作り上げていくので、まずwebの形を作るのに苦労した。ER図、データベース設計や管理、trelloの構築など。MVCの流れを深く理解していないことに気づいた　　　が再度勉強し直した。】

・学習で苦労した事/工夫した事【質問サービスのteratailなどを活用した。】

・学習で得た感想【webアプリの仕組み（MVCの流れやhtml.cssなど）を多少理解できるようになった。検証ツールを使ったり、いつも利用しているwebアプリがどのように作られているか考えるきっかけになった。同期のメンバーに相談する事で自分にはない視点で物事を
考えられるようになった。プログラミンを通じて自分を見つめ直すいい機会が持てた。】

https://user-images.githubusercontent.com/75568944/113438566-c7b18c00-9423-11eb-8cd3-71597b12dee0.jpeg







# テーブル設計



## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------  | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| role               | integer | null: false, default: 0   |

### Association

- has_many   :orders
- has_many   :addresses
- has_many   :sns_credentials



## sns_credentials テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| provider           | string     |
| uid                | string     |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user




## products テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| product_name           | string     | null: false                    |
| price                  | integer    | null: false, default: 0        |
| info                   | text       | null: false                    |

### Association

- has_many    :order_items


## orders テーブル

| Column                      | Type       | Options                        |
| --------------------------  | ---------- | ------------------------------ |
| scheduled_delivery_date_id  | integer    | null: false, default: 0        |
| scheduled_delivery_time_id  | integer    | null: false, default: 0        |
| user                        | references | null: false, foreign_key: true |


### Association

- belongs to  :user
- belongs to  :address
- has_many    :order_items



## order_items テーブル

| Column                      | Type       | Options                        |
| --------------------------- | ---------- | ------------------------------ |
| quantity                    | integer    | null: false, default: 0        |
| order                       | references | null: false, foreign_key: true |
| product                     | references | null: false, foreign_key: true |

- belongs to :order
- belongs to :product






## addresses テーブル

| Column                      | Type       | Options                        |
| --------------------------- | ---------- | ------------------------------ |
| postal_code                 | string     | null: false                    |
| prefecture_id               | integer    | null: false, default: 0        |
| city                        | string     | null: false                    |
| town                        | string     | null: false                    |
| building                    | string     |
| phone_number                | string     | null: false                    |
| user                        | references | null: false, foreign_key: true |


### Association

- belongs to :user
- has_many   :orders







