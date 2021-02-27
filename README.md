# アプリケーション内容


| アプリケーション名　　　　　　　　　|　トモリ珈琲　online shop    　　　　　　|
| アプリケーション概要　　　　　　　　|　珈琲関係のショッピングサイト　　　　　　　|
| URL  　　　　　　　　　　　　　　　|　　　　　　　　　　　　　　　　　　　　　　|
| テスト用アカウント　　　　　　　　　|　　　　　　　　　　　　　　　　　　　　　　|
| 利用方法　　　　　　　　　　　　　　|　　　　　　　　　　　　　　　　　　　　　　|
| 目指した課題解決　　　　　　　　　　|　　　　　　　　　　　　　　　　　　　　　　|
| 洗い出した要件　　　　　　　　　　　|　　　　　　　　　　　　　　　　　　　　　　|
| 実装した機能についてのGIFと説明  　|　　　　　　　　　　　　　　　　　　　　　　|
| 実装予定の機能　　　　　　　　　　　|　　　　　　　　　　　　　　　　　　　　　　|
| データベース設計　　　　　　　　　　|　　　　　　　　　　　　　　　　　　　　　　|
| ローカルでの動作方法　　　　　　　　|　　　　　　　　　　　　　　　　　　　　　　|















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
| --------------------------  | ---------- | ------------------------------ |
| quantity                    | integer    | null: false, default: 0        |
| order                       | references | null: false, foreign_key: true |
| product                     | references | null: false, foreign_key: true |

- belongs to :order
- belongs to :product






## addresses テーブル

| Column                      | Type       | Options                        |
| -----------------           | ---------- | ------------------------------ |
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







