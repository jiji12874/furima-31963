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

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |
| password_include   | string              | null: false             |
| nickname           | string              | null: false             |
| birth_date         | date                | null: false             |
| last_name          | string              | null: false             |
| first_name         | string              | null: false             |
| last_name_kana     | string              | null: false             |
| first_name_kana    | string              | null: false             |

### Association

* has_many :purchase
* has_many :items

## purchase table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|

### Association

- belongs_to :users
- belongs_to :items
- has_one :purchase

## items table

| Column        | Type       | Options           |
|---------------|------------|-------------------|
| name          | string     | null: false       |
| info          | text       | null: false       |
| price         | integer    | null: false       |
| category_id   | integer    | null: false       |
| sale_id       | integer    | null: false       |
| shipping_id   | integer    | null: false       |
| prefecture    | integer    | null: false       |
| scheduled_id  | integer    | null: false       |

### Association

- belongs_to :users
- has_one :purchase

## address table

| Column         | Type       | Options           |
|----------------|------------|-------------------|
| postal         | string     | null: false       |
| prefecture     | string     | null: false       |
| city           | string     | null: false       |
| prefecture     | string     | null: false       |
| addresses      | string     | null: false       |
| phone_number   | string     | null: false       |
| phone_number   | string     | null: false       |
| building_name  | string     | null: false       |
| purchase table | string     | foreign_key: true |



### Association

- belongs_to :purchase
