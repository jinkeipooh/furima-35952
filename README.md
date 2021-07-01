# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| nickname             | string | null: false |
| last_name            | string | null: false |
| first_name           | string | null: false |
| last_name_r          | string | null: false |
| first_name_r         | string | null: false |
| birthday             | date   | null: false |

### Association

- has_many :items
- has_many :orders


##items テーブル

| Column        | Type       | Options           |
| ------------  | ---------- | ----------------- |
| name          | string     | null: false       |
| text          | text       | null: false       |
| category_id   | integer    | null: false       |
| condition_id  | integer    | null: false       |
| charge_id     | integer    | null: false       |
| prefecture_id | integer    | null: false       |
| day_id        | integer    | null: false       |
| price         | integer    | null: false       |
| user          | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order


##orders テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


##addresses テーブル      
      
| Column        | Type       | Options           |
| ------------  | ---------- | ----------------- |
| post_code     | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| house_num     | string     | null: false       |
| building      | string     |                   |
| phone_num     | string     | null: false       |
| order         | references | foreign_key: true |

### Association

- belongs_to :order

