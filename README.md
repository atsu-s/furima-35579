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
- belongs_to :order

## items テーブル

| Column             | Type      | Option                         |
|--------------------|-----------|--------------------------------|
| title              | string    | null: false                    |
| text               | text      | null: false                    |
| category_id        | string    | null: false                    |
| status_id          | string    | null: false                    |
| delivery_charge_id | string    | null: false                    |
| prefecture_id      | string    | null: false                    |
| period_id          | string    | null: false                    |
| price              | string    | null: false                    |
| user               | reference | null: false, foreign_key: true |
| image              |           |                                |

### Association

- belongs_to :user
- belongs_to :order

## buyers テーブル

| Column        | Type      | Option                        |
|---------------|-----------|-------------------------------|
| postal_code   | integer   | null: false                   |
| prefecture_id | integer   | null: false                   |
| city_name     | string    | null: false                   |
| address       | string    | null: false                   |
| building_name | integer   | null: false                   |
| tell_number   | string    | null: false                   |
| order         | reference | null: false, foreign_key: true|

### Association

- belongs_to :order

## orders テーブル

| Column       | Type      | Option                         |
|--------------|-----------|--------------------------------|
| user         | reference | null: false, foreign_key: true |
| item         | reference | null: false, foreign_key: true |

### Association

has_many :user
has_many :item