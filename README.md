# テーブル設計

## users テーブル

| Column               | Type     | Options     |
| -------------------- | -------- | ----------- |
| email                | string   | null: false |
| encrypted_password   | string   | null: false |
| nickname             | string   | null: false |
| last_name            | string   | null: false |
| first_name           | string   | null: false |
| last_name_r          | string   | null: false |
| first_name_r         | string   | null: false |
| birthday             | datetime | null: false |

### Association

- has_many :items
- has_many :purchases


##items テーブル

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| image     | string     | null: false       |
| name      | string     | null: false       |
| text      | text       | null: false       |
| category  | text       | null: false       |
| condition | text       | null: false       |
| charge    | text       | null: false       |
| ship_from | text       | null: false       |
| days      | text       | null: false       |
| price     | text       | null: false       |
| user      | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchases


##purchases テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |
| shipping | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :shipping


##shippings テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| post_code    | string | null: false |
| prefecture   | string | null: false |
| municipality | string | null: false |
| addless      | string | null: false |
| building     | string |             |
| phone_num    | string | null: false |

### Association

has_many :purchases

