## DB設計

## users table
| Column           | Type     | Options                    |
| ---------------- | ----     | -------                    |
|  nickname        |  string  |  null: false               |
|  email           |  string  |  null: false               |
|  last_name       |  string  |  null: false               |
|  first_name      |  string  |  null: false               |
|  last_name_kana  |  string  |  null: false               |
|  first_name_kana |  string  |  null: false               |
|  birthday        |  date    |  null: false               |
|  email           | string   |  null: false, unique: true |

- belongs_to :address
- belongs_to :credit
- has_many :items
- has_many :comments



## address table

| Column       | Type | Options       |
| ------       | ---- | -------       |
| postcode     | string |  null: false|
| prefecture   | string | null: false |
| municipality | string | null: false |
| address      | swtring| null: false |
| romm_number  | string | null: false |
| phone        | string | null: false |

- belongs_to :user





 
### item table
| Column          | Type   | Options                         |
| ------          | ----   | -------                         |
| name_id         | string | null: false                     |
| explanation_id  | string | null: false                     |
| brand_id        | string | null: false                     |
| condition_id    | string | null: false                     |
| postage_id      | date   | null: false                     |
| area_id         | string | null: false                     |
| price_id        | integer| null: false                     |
| day_id          | data   | null:false                      |
| user_id         | integer| null: false, foregin_key : true |

- belongs_to :user
- has_many :comments




## credit table
| Column      | Type    | Options                         |
| ------      | ----    | -------                         |
| user_id     | integer | null: false, foregin_key : true |
| customer_id | integer | null: false, foregin_key : true |
| card_id     | integet | null: false, foregin_key : true |

- belongs_to: user 



## commets table
| Column  | Type    | Options                         |
| ------  | ----    | -------                         |
| item_id | integer | null: false, foregin_key : true |
| user_id | integer | null: false, foregin_key : true |
| comment | text    | null: false                      |

- belongs_to: item
- belongs_to: user


## buy table
| Column  | Type    | Options                         |
| ------  | ----    | -------                         |
| user_id | string  | null :false                     |
| item_id | string  | null :false                     |
 
- belongs_to : user
