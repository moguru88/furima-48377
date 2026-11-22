## Users

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| email              | string | null: false, unique: true  |
| encrypted_password | string | null: false                |
| nickname           | string | null: false                |
| first_name         | string | null: false                |
| first_name_kana    | string | null: false                |
| family_name        | string | null: false                |
| family_name_kana   | string | null: false                |
| date_of_birth      | date   | null: false                |

### Association
- has_many :items
- has_many :purchases

## Items

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user_id          | references | null: false, foreign_key: true |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| shipping_fee_id  | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| price            | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :purchase


## Purchases

| Column          | Type       | Options                                      |
| --------------- | ---------- | -------------------------------------------- |
| user_id         | references | null: false, foreign_key: true               |
| item_id         | references | null: false, unique: true, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## Addresses

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| purchase_id     | references | null: false, foreign_key: true |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| address_line1   | text       | null: false                    |
| address_line2   | text       |                                |
| phone_number    | string     | null: false                    |

### Association
- belongs_to :purchase