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
- has_many :addresses
- has-many :credits

## products テーブル

| Column          | Type       | Options                       |
| -------------   | ------     | -----------                   |
| product_name    | string     | null: false                   |
| category_id     | integer    | null: false                   |
| price           | integer    | null: false                   |
| brand           | string     | null: false                   |
| description     | text       | null: false                   |
| comment         | text       | null: false                   |
| status_id       | integer    | null: false                   |
| shipping_id     | integer    | null: false                   |
| send_day_id     | integer    | null: false                   |
| shipping_source | string     | null: false                   |
| user            | references | null: false, foreign_key: true|
| credit          | references |                               |
| address         | references |                               |

### Association

- has_many :comments
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
| post_code        | integer    | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    | 
| flat number      | integer    | null: false                    | 
| apartment        | string     |                                |
| phone number     | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## Purchase_user テーブル

| Column           | Type       | Options                        |
| -------------    | ------     | -----------                    |
| user             | references | null: false, foreign_key: true |
| product          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product