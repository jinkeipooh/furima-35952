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
- has_many :purchases


##items テーブル

| Column        | Type       | Options           |
| ------------  | ---------- | ----------------- |
| name          | string     | null: false       |
| text          | text       | null: false       |
| category_id   | integer    | null: false       |
| condition_id  | integer    | null: false       |
| charge_id     | integer    | null: false       |
| prefecture_id | integer    | null: false       |
| days_id       | integer    | null: false       |
| price         | integer    | null: false       |
| user          | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchases


##purchases テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping


##shippings テーブル      
      
| Column        | Type       | Options           |
| ------------  | ---------- | ----------------- |
| post_code     | string     | null: false       |
| prefecture_id | integer    | null: false       |
| municipality  | string     | null: false       |
| addless       | string     | null: false       |
| building      | string     |                   |
| phone_num     | string     | null: false       |
| purchase      | references | foreign_key: true |

### Association

- belongs_to :purchases

