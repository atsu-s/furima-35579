# テーブル設計

## users テーブル

| Column             | Type   | Option                    |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name_kanji  | string | null: false               |
| first_name_kanji   | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many   :items
- has_many   :order

## items テーブル

| Column             | Type       | Option                         |
|--------------------|------------|--------------------------------|
| title              | string     | null: false                    |
| text               | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| period_id          | integer    | null: false                    |
| price              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one_attached :order

## buyers テーブル

| Column        | Type       | Option                        |
|---------------|------------|-------------------------------|
| postal_code   | string     | null: false                   |
| prefecture_id | integer    | null: false                   |
| city_name     | string     | null: false                   |
| address       | string     | null: false                   |
| building_name | string     |                               |
| tell_number   | string     | null: false                   |
| order         | references | null: false, foreign_key: true|

### Association

- belongs_to :order

## orders テーブル

| Column       | Type       | Option                         |
|--------------|------------|--------------------------------|
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one_attached :buyer