# テーブル設計

## users テーブル

| Column      | Type   | Options      |
| ----------- | ------ | ------------ |
| nickname    | string | null: false  |
| email       | string | null: false, |
| password    | string | null: false  |
| family_name | string | null: false  |
| first_name  | string | null: false  |
| family_name | string | null: false  |
| first_name  | string | null: false  |
| birthday    | date   | null: false  |

### Association

- has_many :items
- has_many :sold_out

## items テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| image    | text       | null: false                    |
| name     | string     | null: false                    |
| text     | string     | null: false                    |
| price    | integer    | null: false                    |
| category | string     | null: false                    |
| status   | string     | null: false                    |
| user_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :sold_out

## sold_out テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |


### Association テーブル

- belongs_to: user
- belongs_to: item
- has_one: detail

## detail テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_info     | integer    | null: false                    |
| card_deadline | integer    | null: false                    |
| card_code     | integer    | null: false                    |
| postal_code   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| house_num     | string     | null: false                    |
| building      | string     |                                |
| phone         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association

- belongs_to: sold_out