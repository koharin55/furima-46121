# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| id                 | bigint | null: false, unique: true |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders
- has_many :shipments

## items テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| id                 | bigint   | null: false, unique: true |
| name               | string   | null: false               |
| description        | string   | null: false               |
| category           | string   | null: false               |
| condition          | string   | null: false               |
| shipping_fee       | string   | null: false               |
| shipping_region    | string   | null: false               |
| shipping_days      | string   | null: false               |
| price              | integer  | null: false               |
| status             | string   | null: false               |
| created_at         | datetime | null: false               |
| updated_at         | datetime | null: false               |
| seller_id          | string   | null: false               |

### Association

- has_one :order
- belongs_to :user

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| id          | bigint     | null: false, unique: true      |
| created_at  | datetime   | null: false                    |
| item_id     | references | null: false, foreign_key: true |
| buyer_id    | references | null: false, foreign_key: true |
| seller_id   | references | null: false, foreign_key: true |
| shipment_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_one :shipment

## shipments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| id            | bigint     | null: false, unique: true      |
| zip           | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone         | string     | null: false                    |
| order_id      | references | null: false, foreign_key: true |
| buyer_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order