# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# fleamarket_sample_76a

# DB設計
***
## ER Diagram
<img width="1262" alt="3ceed874f69d0f51b09b8099d5660ddc" src="https://user-images.githubusercontent.com/65844442/89635888-acb56900-d8e2-11ea-953b-70ea5055d1b6.png">

***

## Usersテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|nickname|string|null: false|
|email|string|null: false, unipue: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday|date|null: false|
### Association
- has_many :items, dependent:destroy
- has_many :chats, dependent:destroy
- has_many :favorited_items, through: :favorites, source: :item
- has_one :address, dependent:destroy
- has_one :credit_card, dependent:destroy
- has_many :sell_items, class_name: 'Item', foreign_key: seller_id
- has_many :buy_items, class_name: 'Item', foreign_key: buyer_id
***

## Itemsテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|name|string|null: false|
|description|text|null: false|
|brand|string|null: false|
|condition|integer|null: false (enum)|
|status|integer|null: false (enum)|
|shipping_costs|integer|null: false (enum)|
|shipping_from|integer|null: false (enum)|
|shipping_date|integer|null: false (enum)|
|price|integer|null: false|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
### Association
- has_many :images, dependent:destroy
- has_many :chats, dependent:destroy
- has_many :favorites
- belongs_to :user
- belongs_to :category
- belongs_to :seller, class_name: 'User'
- belongs_to :buyer, class_name: 'User'
***

## Addressesテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|posta_code|string|null: false|
|prefecturs|string|null: false|
|municipalities|string|null: false|
|block_number|string|null: false|
|building_name|string||
|phone_number|string||
|user_id|references|null: false,foregin_key: true|
### Association
- belongs_to :user
***

## Credit_cardsテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|customer_id|string|null: false|
|card_id|string|null: false|
|user_id|references|null: false,foregin_key: true|
### Association
- belongs_to :user
***

## Faviritesテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|user_id|references|null: false,foregin_key: true|
|item_id|references|null: false,foregin_key: true|
### Association
- belongs_to :user
- belongs_to :item
***

## Chatsテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|text|text|null :false|
|user_id|references|null: false,foregin_key: true|
|item_id|references|null: false,foregin_key: true|
### Association
- belongs_to :user
- belongs_to :item
***

## Categoriesテーブル
|Column|Type|Options|
|:-----|:---|:-----:|
|name|string|null :false|
### Association
has_many :items
***