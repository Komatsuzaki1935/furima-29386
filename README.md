# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| first_name          | string | null: false |
| last_name           | string | null: false |
| furigana_first_name | string | null: false |
| furigana_last_name  | string | null: false |
| birthday            | date   | null: false |

### Association

- has_many :products
- has_many :comments
- has_many :purchases

## products テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| name            | string  | null: false |
| explanation     | text    | null: false |
| price           | integer | null: false |
| category        | integer | null: false |
| condition       | integer | null: false |
| shipping_charge | integer | null: false |
| shipping_from   | integer | null: false |
| shipping_day    | integer | null: false |

### Association

- belongs_to :user
- belongs_to :purchase
- has_many :comments

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product

## purchases テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| credit_num            | integer | null: false |
| credit_deadline       | integer | null: false |
| credit_cvv            | integer | null: false |
| postal_code           | integer | null: false |
| postal_prefecture     | string  | null: false |
| postal_municipalities | string  | null: false |
| postal_address        | integer | null: false |
| postal_building       | string  | null: false |
| phone_num             | integer | null: false |

### Association

- belongs_to :user
- has_many :products