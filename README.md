## users

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name_kan      | string | null: false |
| first_name_kan     | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_burden_id | integer    | null: false                    |
| delivery_area_id   | integer    | null: false                    |
| delivery_date_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase
- belongs_to :category
- belongs_to :status
- belongs_to :delivery_burden
- belongs_to :delivery_area
- belongs_to :delivery_date

## purchases

| Column | Type       | Options                                      |
| ------ | ---------- | -------------------------------------------- |
| item   | references | null: false, unique: true, foreign_key: true |
| user   | references | null: false, unique: true, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses

| Column        | Type      | Options                        |
| ------------- | --------- | ------------------------------ |
| postalcode    | string    | null: false                    |
| prefecture_id | integer   | null: false                    |
| municipality  | string    | null: false                    |
| house_number  | string    | null: false                    |
| building_name | string    |                                |
| phonenumber   | string    | null: false                    |
| purchase      | reference | null: false, foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to :prefecture
