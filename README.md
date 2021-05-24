# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ----------       | ------  | ----------- |
| email            | string  | null: false |
| password         | string  | null: false |
| nickname         | string  | null: false |
| birthday_month   | integer | null: false |
| birthday_day     | integer | null: false |
| birthday_year    | integer | null: false |
| credit_card      | integer | null: false |
| first_name_kanji | string  | null: false |
| last_name_kanji  | string  | null: false |
| first_name_kana  | string  | null: false |
| last_name_kana   | string  | null: false |



### Association

- has_many :products
- has_many :comments
- has_many :addresses
- has-many :credits

## products テーブル

| Column          | Type       | Options                       |
| -------------   | ------     | -----------                   |
| product_name    | text       | null: false                   |
| category        | string     | null: false                   |
| price           | string     | null: false                   |
| brand           | string     | null: false                   |
| description     | text       | null: false                   |
| comment         | text       | null: false                   |
| status          | string     | null: false                   |
| shipping        | string     | null: false                   |
| send day        | string     | null: false                   |
| shipping_source | string     | null: false                   |
| shipping_address| string     | null: false                   |
| user_id         | references | null: false, foreign_key: true|
| credit_id       | references |                               |
| address_id      | references |                               |

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
- has_many :products


## credits テーブル

| Column           | Type       | Options      |
| -------------    | ------     | -----------  |
| card number      | integer    | null: false  |
| expiration_month | integer    | null: false  |
| expiration_year  | integer    | null: false  |
| security_code    | integer    | null: false  |
### Association

- belongs_to :user

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