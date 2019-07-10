# README

# What is Free market application?
Users can sell and also purchase items through this applications.

- new registration system
- register multi items information (ex. images, price, size etc)
- search items
- show items each for category
- payment system (purchase and selling system) 
- check selling, sold, purchased items (historical)  
 

# Design DB Scheme

>## Table： ’*Users*’
Basic information for user (ex. nickname, password, e-mail)

| Column        | Type          | Options    |
| ------------- |:-------------:| -----------|
| id            |               |            |
| nickname      | string       | null:false  |
| email         | string       | null:false  |
| created_at    | datetime     | null:false  |
| update_at     | datetime     | null:false  |

*Gem device

### Association
- has_one :user_detail, optional: true, dependent: :delete
- has_many :items, through likes, through: users_items, dependent: :destroy
- has_many_active_hash :evaluations, through: :users_evaluations, dependent: :destroy

>## Table: '*User_details*'
Detail information for user (ex. name, birthday, addresses etc)

| Column           | Type      | Options    |
| -----------------|:---------:| -----------|
| id               |           |            |
| first_name       | string    | null:false |
| family_name      | string    | null:false |
| kana_first_name  | string    | null:false |
| kana_family_name | string    | null:false |
| birthday         | integer   | null:false |
| postalcode       | integer   | null:false |
| prefecture_id    | reference | null:false, foreign_key: true |
| city             | string    | null:false |
| address          | string    | null:false |
| building         | string    |            |
| phone_number     | integer   | null:false |
| user_id          | reference | null:false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to_active_hash :prefecture


>## Table: '*Prefectures*'
Prefectures and overseas users live.

| Column         | Type       | Options   |
| -------------- |:----------:| ----------|
| id             |            |           |
| prefecture     | text       | null:false, active-hash |


### Association
- has_many :user_details
- belongs_to :item


>## Table: '*Evaluations*'
Evaluation for each user by other users (ex. Excellent, Good, Bad)

| Column       | Type       | Options   |
| -------------|:----------:| ----------|
| id           |            |           |
| evaluation   | integer    | null:false, active-hash |

### Association
- has_many :users, through :users_evaluations


>## Table:'*Users_evaluations*'(Intermediate)
saving user_id and evaluations_id for one record.

| Column        | Type          | Options    |
| ------------- |:-------------:| -----------|
| id            |               |            |
| evaluation_id | reference     | null:false, foreign_key:true   |
| user_id       | reference     | null:false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to_active_hash :evaluation

>## Table: '*Users_items*' (intermediate)
| Column        | Type          | Options   |
| ------------- |:-------------:| ----------|
| id            |               |           |
| user_id       | reference     | null:false, foreign_key: true |
| item_id       | reference     | null:false, foreign_key: true |
| payjp_id      | reference     | null:false, foreign_key: true |

* Payjp column would be changed when setting Payjp function. 

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :payjp


>## Table: '*Items*'
Selling items

| Column        | Type          | Options   |
| ------------- |:-------------:| ----------|
| id            |               |           |
| image_id      | reference | null:false |
| item_title    | text      | null:false |
| description   | text      | null:false |
| category_id | reference   | null:false, foreign_key: true |
| size_id     | reference   | null:false, foreign_key: true |
| brand_id    | reference   | null:false, foreign_key: true |
| status_id   | reference   | null:false, foreign_key: true |
| delivery_fee_payer_id | reference | null:false, foreign_key: true |
| delivery_method_id    | reference | null:false, foreign_key: true |
| prefecture_id         | reference | null:false, foreign_key: true |
| shipping_day_id       | reference | null:false, foreign_key: true |
| price       | integer     | null:false |
| user_id     | reference   | null:false, foreign_key: true  |
| create_at   | daytime     | null:false |
| update_at   | daytime     | null:false |

### Association
- has_many :item_images
- belongs_to :user
- has_many :users, through: :users_items
- has_many :users, through: :likes
- belongs_to :category
- belongs_to_active_hash :size
- belongs_to_active_hash :status
- belongs_to_active_hash :brand
- belongs_to_active_hash :delivery_fee_payer
- belongs_to_active_hash :delivery_method
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_day

>## Table: '*Item_images*'
Images for selling items (up to 10)

| Column      | Type       | Options    |
| ------------|:----------:| -----------|
| id          |            |            |
| image_url   | string     | null:false |
| item_id     | reference  | null:false, foreign_key: true |

### Association
- belongs_to :item


>## Table: '*Likes*' (Intermediate)
'likes' mark to item and user can keep the items on "favourite" screen.

| Column    | Type       | Options   |
| --------- |:----------:| ----------|
| id        |            |           |
| item_id   | reference  | null:false, foreign_key: true |
| user_id   | reference  | null:false, foreign_key: true |

### Association
- belongs_to :item 
- belongs_to :user


>## Table: '*Categories*' (Intermediate)
| Column        | Type          | Options   |
| ------------- |:-------------:| ----------|
| id            |               |           |
| first_category_id  | reference  | null:false, foreign_key: true, active-hash  |
| second_category_id | reference  | null:false, foreign_key: true, active-hash  |
| third_category_id  | reference  | null:false, foreign_key: true, active-hash  |

### Association
- has_many :items
- has_many :sizes, through:sizes_categories

>## Table: '*Brands*'
Brands for items (Incremental search is prefer)

| Column  | Type       | Options     |
| ------- |:----------:| ------------|
| id      |            |             |
| brand   | string     | null:false  |

### Association
- has_many :items

>## Table: '*Sizes_categories*'  (Intermediate)

| Column        | Type          | Options   |
| ------------- |:-------------:| ----------|
| id            |               |           |
| size_id     | reference | null:false, foreign_key: true, active_hash |
| category_id | reference | null:false, foreign_key: true, active_hash |

### Association
- belongs_to_active_hash :size
- belongs_to_active_hash :category



>## Table: 'Sizes'
Sizes for some items (not all) in third categories 

| Column    | Type      | Options   |
| --------- |:---------:| ----------|
| id        |           |           |
| size      | string    | null:false, active-hash |

### Association
- has_many :items, 
- belongs_to_active_hash :category, through sizes_categories


>## Table: 'Status'
Status for items. (ex. New, Excellent, Good, Ok, Not bad, Bad)

| Column     | Type      | Options   |
| ---------- |:---------:| ----------|
| id         |           |           |
| status     | string    | null:false, active-hash  |
*Gem AASM

### Association
- has_many :items

>## Table: 'Shipping_days'
Shipping Days before delivery (ex.1-2, 2-3, 3-4 days)

| Column   | Type       | Options   |
| ---------|:----------:| ----------|
| id       |            |           |
| Shipping_days | string     | null:false, active-hash |

### Association
- has_many :items

>## Table:'Delivery_fee_payers'
Payer for delivery fee (seller or buyer)

| Column      | Type     | Options   |
| ----------- |:--------:| ----------|
| id          |          |           |
| payer       | string   | null:false, active-hash|

### Association
- has_many :items


## Development Environment

Ruby 2.3.1
Rails 5.0.7.2

## Gem
Devise, Active hash, kaminari, Aasm, OmniAuth - Rails CSRF,
