# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| name                | string | null: false |
| email               | string | null: false |
| password            | string | null: false |
| first_name          | string | null: false |
| last_name           | string | null: false |
| furigana_first_name | string | null: false |
| furigana_last_name  | string | null: false |
| birthday_year       | string | null: false |
| birthday_month      | string | null: false |
| birthday_day        | string | null: false |

### Association

- has_many :products
- has_many :comments

## products テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| price           | string | null: false |
| category        | string | null: false |
| condition       | string | null: false |
| shipping_charge | string | null: false |
| shipping_from   | string | null: false |
| shipping_day    | string | null: false |
| image           | text   | null: false |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user
