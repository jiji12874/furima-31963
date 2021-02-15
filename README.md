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
| password           | string              | null: false             |
| password_include   | string              | null: false             |
| nickname           | string              | null: false             |
| birth_date         | date                | null: false             |
| last_name          | string              | null: false             |
| first_name         | string              | null: false             |
| last_name_kana     | string              | null: false             |
| first_name_kana    | string              | null: false             |

### Association

* belongs_to :purchase
* has_many :items

## purchase table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| purchased_items                     | references | foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :purchase

## items table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| image       | string     | null: false       |
| name        | string     | null: false       |
| info        | string     | null: false       |
| price       | integer    | null: false       |
| category    | string     | null: false       |
| sales       | string     | null: false       |
| shipping    | string     | null: false       |
| prefecture  | string     | null: false       |
| scheduled   | string     | null: false       |

### Association

- belongs_to :users
- has_one :purchase

## address table

| Column       | Type       | Options           |
|--------------|------------|-------------------|
| token        | string     | null: false       |
| postal       | string     | null: false       |
| prefecture   | string     | null: false       |
| city         | string     | null: false       |
| prefecture   | string     | null: false       |
| addresses    | string     | null: false       |
| phone number | integer    | null: false       |


### Association

- belongs_to :purchase
