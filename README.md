#テーブル設計

## users テーブル
| Column              | Type     | Options                     |
| ------------------- | -------- | --------------------------- |
| email               | string   | null: false, unique:true    |
| ecvrypted_password  | string   | null: false                 |
| nick_name           | string   | null: false                 |
| first_name          | string   | null: false                 |
| last_name           | string   | null: false                 |
| first_name_kana     | string   | null: false                 |
| last_name_kana      | string   | null: false                 |
| birthday            | data     | null: false                 |

### Association

- has_many :items
- has_many :orthers

## itemsテーブル
| Column              | Type     | Options                     |
| ------------------- | -------- | --------------------------- |
| item_name           | string   | null:false                  |
| discription         | text     | null:false                  |
| condition_id        | integer  | null:false                  |
| category_id         | integer  | null:false                  |
| delivery_charge_id  | integer  | null:false                  |
| prefecture_id       | integer  | null:false                  |
| shipping_date_id    | integer  | null:false                  |
| price               | integer  | null:false                  |
| user                |references| null:false,foreign_key:true |

### Association

- belongs_to :user
- has_one :orther


## addressesテーブル
| Column              | Type     | Options                     |
| ------------------- | -------- | --------------------------- |
| postal_code         | string   | null:false                  |
| prefecture_id       | integer  | null:false,foreign_key:true |
| city                | string   | null:false                  |
| street              | string   | null:false                  |
| buillding           | string   |                             |
| phone               | string   | null:false                  |

### Association

- belongs_to :orthers
- belongs_to :user


## orthersテーブル
| Column              | Type     | Options                     |
| ------------------- | -------- | --------------------------- |
| user                |references| foreign_key:true            |
| item                |references| null:false,foreign_key:true |
| addresses           |references| null:false                  |

### Association

- belongs_to :items
- has_many :addresse
- belongs_to :user