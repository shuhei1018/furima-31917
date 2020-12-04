## users

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name_kan   | string  | null: false |
| first_name_kan  | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birthday_id     | integer | null: false |

### Association

- belongs_to :birthday
- has_many :items
- has_many :purchases

<!-- ## birthday
| Column | Type | Options |
| ------ | ---- | ------- |
### Association
- has_many :users -->

## items

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| image              | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_burden_id | integer    | null: false                    |
| delivery_area_id   | integer    | null: false                    |
| delivery_date_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :category
- belongs_to :status
- belongs_to :delivery_burden
- belongs_to :delivery_area
- belongs_to :delivery_date
- belongs_to :user
- has_one :purchase

<!-- ## category
| Column | Type | Options |
| ------ | ---- | ------- |
### Association
- has_many :items -->

<!-- ## status
| Column | Type | Options |
| ------ | ---- | ------- |
### Association
- has_many :items -->

<!-- ## delivery_burden
| Column | Type | Options |
| ------ | ---- | ------- |
### Association
- has_many :items -->

<!-- ## delivery_area
| Column | Type | Options |
| ------ | ---- | ------- |
### Association
- has_many :items -->

<!-- ## delivery_date
| Column | Type | Options |
| ------ | ---- | ------- |
### Association
- has_many :items -->

## purchases

| Column  | Type       | Options                                      |
| ------- | ---------- | -------------------------------------------- |
| item_id | references | null: false, unique: true, foreign_key: true |
| user_id | references | null: false, unique: true, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses

| Column        | Type    | Options                       |
| ------------- | ------- | ----------------------------- |
| postalcode    | integer | null: false                   |
| prefecture    | integer | null: false                   |
| municipality  | string  | null: false                   |
| house_number  | string  | null: false                   |
| building_name | string  |                               |
| phonenumber   | integer | null: false                   |
| purchase_id   | integer | ull: false, foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to :prefecture

<!-- ## prefecture
| Column | Type | Options |
| ------ | ---- | ------- |
### Association
- has_many :addresses -->
