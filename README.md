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

# DB 設計

## users table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| email              | string              | null: false ,unique: true      |
| encrypted_password | string              | null: false                    |
| nickname           | string              | null: false                    |
| birth_date         | date                | null: false                    |
| last_name          | string              | null: false                    |
| first_name         | string              | null: false                    |
| last_name_kana     | string              | null: false                    |
| first_name_kana    | string              | null: false                    |

### Association

* has_many :purchases
* has_many :items

## purchase table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| user                                | references | null: false, foreign_key: true |
| item                                | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## items table

| Column        | Type       | Options                         |
|---------------|------------|---------------------------------|
| user          | references | null: false , foreign_key: true |
| name          | string     | null: false                     |
| info          | text       | null: false                     |
| price         | integer    | null: false                     |
| category_id   | integer    | null: false                     |
| sale_id       | integer    | null: false                     |
| shipping_id   | integer    | null: false                     |
| prefecture_id | integer    | null: false                     |
| scheduled_id  | integer    | null: false                     |

### Association

- belongs_to :user
- has_one :purchase

## address table

| Column         | Type       | Options           |
|----------------|------------|-------------------|
| postal         | string     | null: false       |
| city           | string     | null: false       |
| prefecture_id  | integer    | null: false       |
| addresses      | string     | null: false       |
| phone_number   | string     | null: false       |
| building_name  | string     |                   |
| purchase       | references | foreign_key: true |



### Association

- belongs_to :purchase
