# テーブル設計

## users テーブル

| Column               | Type   | Options      |
| -------------------- | ------ | ------------ |
| nickname             | string | null: false  |
| email                | string | null: false, |
| password             | string | null: false  |
| family_name          | string | null: false  |
| first_name           | string | null: false  |
| family_name_katakana | string | null: false  |
| first_name_katakana  | string | null: false  |
| birthday             | date   | null: false  |

### Association

- has_many :items
- has_many :sold_outs

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | text       | null: false                    |
| name          | string     | null: false                    |
| text          | string     | null: false                    |
| price         | integer    | null: false                    |
| category_id   | integer    | null: false                    |
| status_id     | integer    | null: false                    |
| cost_id       | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| day_id        | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :sold_out

## sold_out テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association テーブル

- belongs_to: user
- belongs_to: item
- has_one: detail

## detail テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | string     | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| house_num   | string     | null: false                    |
| building    | string     |                                |
| phone       | string     | null: false                    |
| user_id     | references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |

### Association

- belongs_to: sold_out