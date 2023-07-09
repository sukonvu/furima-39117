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



## itemsテーブル
| Column              | Type     | Options                     |
| ------------------- | -------- | --------------------------- |
| item_name           | string   | null:false                  |
| discription         | text     | null:false                  |
| condition           | string   | null:false                  |
| category            | string   | null:false                  |
| delivery_charge     | string   | null:false                  |
| shipping_address    | string   | null:false                  |
| shipping_date       | string   | null:false                  |
| price               | integer  | null:false                  |
| user_i              |references| null:false, foreign_key:true|


## commentsテーブル
| Column              | Type     | Options                     |
| ------------------- | -------- | --------------------------- |
| content             | text     | null:false                  |
| item_id             |references| null:false, foreign_key:true|
| user_id             |references| null:false, foreign_key:true|


## addressesテーブル
| Column              | Type     | Options                     |
| ------------------- | -------- | --------------------------- |
| postal_code         | integer  | null:false                  |
| prefecture          | string   | null:false                  |
| city                | string   | null:false                  |
| street              | string   | null:false                  |
| buillding           | string   |                             |
| phone               | integer  | null:false                  |

## cardsテーブル
| Column              | Type     | Options                     |
| ------------------- | -------- | --------------------------- |
| user_id             |references| foreign_key:true            |
| card_number         | integer  | null:false                  |
| expiration_date     | integer  | null:false                  |
| cvv                 | integer  | null:false                  |