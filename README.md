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

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| explanation        | text    | null: false |
| price_id           | integer | null: false |
| category_id        | integer | null: false |
| condition_id       | integer | null: false |
| shipping_charge_id | integer | null: false |
| shipping_from_id   | integer | null: false |
| shipping_day_id    | integer | null: false |

### Association

- belongs_to :user
- has_many :comments
- belongs_to :purchase

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product

## deliveries テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| postal_code_id        | integer | null: false |
| postal_prefecture     | string  | null: false |
| postal_municipalities | string  | null: false |
| postal_address_id     | integer | null: false |
| postal_building       | string  |             |
| phone_num             | string  | null: false |

### Association

- belongs_to :purchase

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :products
- has_many :delivery