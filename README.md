# テーブル設計

## users テーブル

| Column      | Type    | Options      |
| ----------- | ------- | ------------ |
| nickname    | string  | null: false  |
| email       | string  | null: false, |
| password    | string  | null: false  |
| family_name | string  | null: false  |
| first_name  | string  | null: false  |
| family_name | string  | null: false  |
| first_name  | string  | null: false  |
| birthday    | integer | null: false  |

### Association

- has_many :items
- has_many :sold_out

## items テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| image   | text       | null: false                    |
| name    | string     | null: false                    |
| text    | string     | null: false                    |
| price   | integer    | null: false                    |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :sold_out

## sold_out テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| address | string     | null: false                    |
| item_id | references | null: false, foreign_key: true |


### Association テーブル

- belongs_to: user
- belongs_to: item