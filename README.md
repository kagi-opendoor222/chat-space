# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|email|string|null: false, unique: true|

### association
- has_many :groups, through :members
- has_many :members
- has_many :messages

## groupsテーブル

|Column|Type|Options|
|name|string|null: false, unique: true|
### association
- has_many :users, through :members
- has_many :members
- has_many :messages

## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### association
- belongs_to :user
- belongs_to :group

## messagesテーブル

|Columns|Type|Options|
|------|----|-------|
|text|text||
|image|string||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### association
- belongs_to :user
- belongs_to :group
