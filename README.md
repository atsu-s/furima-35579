# テーブル設計

## users テーブル

| Column           | Type   | Option      |
|------------------|--------|-------------|
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name_kanji| string | null: false |
| first_name_kanji | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| year_id          | string | null: false |
| month_id         | string | null: false |
| day_id           | string | null: false |

### Association

- has_many   :items
- belongs_to :year_id
- belongs_to :month_id
- belongs_to :day_id
- belongs_to :order

## items テーブル

| Column             | Type      | Option                         |
|--------------------|-----------|--------------------------------|
| title              | text      | null: false                    |
| text               | text      | null: false                    |
| category_id        | string    | null: false                    |
| status_id          | string    | null: false                    |
| delivery_charge_id | string    | null: false                    |
| prefecture_id      | string    | null: false                    |
| date_id            | string    | null: false                    |
| price              | string    | null: false                    |
| user               | reference | null: false, foreign_key: true |
| image              |           |                                |

### Association

- belongs_to :user
- belongs_to :category_id
- belongs_to :status_id
- belongs_to :delivery_charge_id
- belongs_to :prefecture_id
- belongs_to :date_id
- belongs_to :order

## cards テーブル

| Column       | Type    | Option      |
|--------------|---------|-------------|
| card_number  | integer | null: false |
| card_month   | integer | null: false |
| card_year    | integer | null: false |
| card_code    | integer | null: false |

### Association

- belongs_to :order

## buyers テーブル

| Column        | Type     | Option      |
|---------------|----------|-------------|
| prefecture_id | integer  | null: false |
| city_name     | string   | null: false |
| address       | string   | null: false |
| tell_number   | string   | null: false |

### Association

- belongs_to :order

## orders テーブル

| Column       | Type      | Option                         |
|--------------|-----------|--------------------------------|
| user         | reference | null: false, foreign_key: true |
| item         | reference | null: false, foreign_key: true |
| card         | reference | null: false, foreign_key: true |
| buyer        | reference | null: false, foreign_key: true |

### Association

has_many :user
has_many :item
has_many :card
has_many :buyer