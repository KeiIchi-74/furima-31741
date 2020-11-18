# テーブル設計

## users テーブル

| Column          | Type    | Options                   |
| --------------- | ------- | ------------------------- |
| nickname        | string  | null: false, unique: true |
| email           | string  | null: false, unique: true |
| password        | string  | null: false               |
| last_name       | string  | null: false               |
| first_name      | string  | null: false               |
| last_name_kana  | string  | null: false               |
| first_name_kana | string  | null: false               |
| birth_date      | date    | null: false               |

### Association

- has_many :items
- has_many :orders
- has_many :favorites
- has_many :favorite_items, through: :favorites, source: :item
- has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
- has_many :followers, through: :active_relationships, source: :follower
- has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
- has_many :followings, through: :passive_relationships, source: :following
- has_many :reports
- has_many :report_items, through: :reports, source: :item
- has_many :messages
- has_many :message_items, through: :messages, source: :item

## items テーブル

| Column                | Type       | Option                         |
| --------------------- | ---------- | ------------------------------ |
| name                  | string     | null: false                    |
| info                  | text       | null: false                    |
| category_id           | integer    | null: false                    |
| sales_status_id       | integer    | null: false                    |
| shipping_fee_id       | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| scheduled_delivery_id | integer    | null: false                    |
| price                 | string     | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_many :favorites, dependent: :destroy
- has_many :favorite_users, through: :favorites, source: :user
- has_many :reports, dependent: :destroy
- has_many :report_users, through: :reports, source: :user
- has_many :messages
- has_many :message_users, through: :messages, source: :user

## orders テーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| order           | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## favoritesテーブル

| Column | Type       | Option            |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item

## relationshipsテーブル

| Column       | Type    | Option |
| ------------ | ------- | ------ |
| following_id | integer |        |
| follower_id  | integer |        |

### Association

- belongs_to :following, class_name: "User"
- belongs_to :follower, class_name: "User"

## reportsテーブル

| Column | Type       | Option            |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item

## messagesテーブル

| Column  | Type       | Option            |
| ------- | ---------- | ----------------- |
| comment | string     |                   |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item