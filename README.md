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
- belongs_to :prefecture
- has_many :items, dependent: :destroy
- has_many :evaluations,through: :user_evaluations, dependent: :destroy
- has_many :likes, through: items, dependent: :destroy
- has_many :cards, dependent: destroy

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
- belongs_to :prefecture


>## Table: '*Prefectures*'
Prefectures and overseas users live.

| Column         | Type       | Options   |
| -------------- |:----------:| ----------|
| id             |            |           |
| name           | text       | null:false, active-hash       |
| user_detail_id | reference  | null:false, foreign_key: true |
| item_id        |  reference | null:false, foreign_key: true |

### Association
- belongs_to :user_detail
- belongs_to :item


>## Table: '*Evaluations*'
Evaluation for each user by other users (ex. Excellent, Good, Bad)

| Column       | Type       | Options   |
| -------------|:----------:| ----------|
| id           |            |           |
| evaluation   | integer    | null:false, active-hash       |
| user_id      | reference  | null:false, foreign_key: true |

### Association
- has_many :users, through :user_evaluations


>## Table:'*Users_evaluations*'(Intermediate)
saving user_id and evaluations_id for one record.

| Column        | Type          | Options    |
| ------------- |:-------------:| -----------|
| id            |               |            |
| evaluation_id | reference     | null:false |
| user_id       | reference     | null:false |

### Association
- has_many :users

># Table: '*User_items*' (intermediate)
| Column        | Type          | Options   |
| ------------- |:-------------:| ----------|
| id            |               |           |
| user_id       | reference     | null:false, foreign_key: true |
| item_id       | reference     | null:false, foreign_key: true |
| payjp_id      | reference     | null:false, foreign_key: true |

* Payjp column would be changed when setting Payjap function. 


># Table: '*Items*'
Selling items

| Column        | Type          | Options   |
| ------------- |:-------------:| ----------|
| id            |               |           |
| image_id      | reference | null:false |
| product_title | text      | null:false |
| description | text        | null:false |
| category_id | reference   | null:false, foreign_key: true |
| size_id     | reference   | null:false, foreign_key: true |
| brand_name  | text        | null:false, foreign_key: true |
| status_id   | reference   | null:false |
| delivery_fee_payer_id | reference | null:false, foreign_key: true |
| delivery_method_id    | reference | null:false, foreign_key: true |
| prefecture_id         | reference | null:false, foreign_key: true |
| shipping_day_id       | reference | null:false, foreign_key: true |
| price       | integer     | null:false |
| user_id     | reference   | null:false |
| create_at   | daytime     | null:false |
| update_at   | daytime     | null:false |

### Association
- has_many :likes 
- has_many :item_images
- belongs_to :delivery_fee_payer 
- belongs_to :shippings_day
- belongs_to :user
- belongs_to :prefecture
- belongs_to :brand
- belongs_to :category
- belongs_to :size
- belongs_to :status


>## Table: '*Item_images*'
Images for selling items (up to 10)

| Column      | Type       | Options    |
| ------------|:----------:| -----------|
| id          |            |            |
| image_url   | string     | null:false |
| item_id     | reference  | null:false, foreign_key: true |

### Association
- belongs_to :item


>## Table: '*Likes*'
'likes' mark to item and user can keep the items on "favourite" screen.

| Column    | Type       | Options   |
| --------- |:----------:| ----------|
| id        |            |           |
| like      | boolean    |           |
| item_id   | reference  | null:false, foreign_key: true |
| user_id   | reference  | null:false, foreign_key: true |

### Association
- belongs_to :item 
- belongs_to :user

>## Table: '*Cards*'
credit cards for purchase items.

| Column      | Type        | Options   |
| ----------- |:-----------:| ----------|
| id          |             |           |
| card_number | integer     | null:false  |
| user_id     | reference   | null:false, foreign_key: true  |

### Association
- belongs_to :user

>## Table: '*Categories*' (Intermediate)
| Column        | Type          | Options   |
| ------------- |:-------------:| ----------|
| id            |               |           |
| first_category_id  | reference  | null:false, foreign_key: true  |
| second_category_id | reference  | null:false, foreign_key: true  |
| third_category_id  | reference  | null:false, foreign_key: true  |

### Association
- belongs_to :first_category
- belongs_to :second_category
- belongs_to :third_category

>## Table: '*First_categories*'
First categories for items (ex.ladies, cars, tickets, books, etc.)

| Column        | Type          | Options   |
| ------------- |:-------------:| ----------|
| id            |               |           |
| name          | integer       | null:false, active-hash|
| second_category_id | reference  | null:false, foreign_key: true  |
| third_category_id  | reference  | null:false, foreign_key: true  |

### Association
- has_many :items
- has_many :second_categories, through: :categories
- has_many :third_categories, through: :categories


>## Table: '*Second_categories*'
Second categories for items(ex.tops, automobile parts, movie ticket, manga, etc.)

| Column        | Type          | Options   |
| ------------- |:-------------:| ----------|
| id            |               |           |
| name          | integer       | null:false, active-hash  |
| first_category_id  | reference   | null:false, foreign_key: true  |
| third_category_id  | reference   | null:false, foreign_key: true  |

### Association
- has_many :items
- has_many :first_categories, through: :categories
- has_many :third_categories, through: :categories

>## Table: '*Third_categories*'
Third categories for items(ex.t-shirt, light, Japanese movie, girl's comic, etc.)

| Column        | Type          | Options   |
| ------------- |:-------------:| ----------|
| id            |               |           |
| name          | integer       | null:false, active-hash  |
| second_category_id  | reference   | null:false, foreign_key: true |
| third_category_id   | reference   | null:false, foreign_key: true |

### Association
- has_many :items
- has_many :first_categories, through: :categories
- has_many :second_categories, through: :categories

>## Table: '*Brands*'
Brands for items (Incremental search is prefer)

| Column  | Type       | Options     |
| ------- |:----------:| ------------|
| id      |            |             |
| name    | string     | null:false  |

### Association
- has_many :items

>## Table: '*Size_third_categories*'  (Intermediate)

| Column        | Type          | Options   |
| ------------- |:-------------:| ----------|
| id            |               |           |
| size_id           | string    | null:false, foreign_key: true  |
| third_category_id | reference | null:false, foreign_key: true  |

### Association
- belongs_to :size
- belongs_to :third_category


>## Table: 'Sizes'
Sizes for some items (not all) in third categories 

| Column    | Type      | Options   |
| --------- |:---------:| ----------|
| id        |           |           |
| size      | string    | null:false, active-hash |

### Association
- has_many :items


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
| day      | string     | null:false, active-hash |

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

