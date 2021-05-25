# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ----------         | ------  | -----------               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| birthday           | date    | null: false               |            
| first_name_kanji   | string  | null: false               |
| last_name_kanji    | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |



### Association

- has_many :products
- has_many :comments
- has_many :purchase_user

## products テーブル

| Column          | Type       | Options                       |
| -------------   | ------     | -----------                   |
| product_name    | string     | null: false                   |
| category_id     | integer    | null: false                   |
| price           | integer    | null: false                   |
| brand           | string     | null: false                   |
| description     | text       | null: false                   |
| status_id       | integer    | null: false                   |
| shipping_id     | integer    | null: false                   |
| send_day_id     | integer    | null: false                   |
| Prefecture_id   | integer    | null: false                   |
| user            | references | null: false, foreign_key: true|


### Association

- has_many :comments
- has_many :Purchase_user
- belongs_to :user


## commentsテーブル

| Column        | Type       | Options                        |
| ------------- | ------     | -----------                    |
| text          | text       | null: false                    |
| user          | references | null: false, foreign_key: true |
| product       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
_ belongs_to :product

## addresses テーブル

| Column           | Type       | Options                        |
| -------------    | ------     | -----------                    |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    | 
| flat_number      | string     | null: false                    | 
| apartment        | string     |                                |
| phone_number     | string     | null: false                    |
| purchase_user    | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## Purchase_user テーブル

| Column           | Type       | Options                        |
| -------------    | ------     | -----------                    |
| user             | references | null: false, foreign_key: true |
| product          | references | null: false, foreign_key: true |

### Association

- has_many :addresses
- belongs_to :user
- belongs_to :product