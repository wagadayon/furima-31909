

## users table
| Column               | Type     | Options                    |
| ----------------     | ----     | -------                    |
|  nickname            |  string  |  null: false               |
|  email               |  string  |  null: false, unique: true |              
|  last_name           |  string  |  null: false               |
|  first_name          |  string  |  null: false               |
|  last_name_kana      |  string  |  null: false               |
|  first_name_kana     |  string  |  null: false               |
|  birthday            |  date    |  null: false               |
|  password            |  string  |  null: false               |  


- has_many :items
- has_many :comments
- has_many :purchases



## addresses table

| Column          | Type       | Options                        |     
| ------          | ----       | -------                        |    
| postcode        | string     | null: false                    |   
| area_id         | integer    | null: false                    | 
| municipality    | string     | null: false                    |
| address_number  | string     | null: false                    | 
| room_nume       | string     |                                |  
| phone_number    | string     | null: false                    | 
| purchase          | references | null: false, foregin_key: true |

- belongs_to : purchases





 
### items table
| Column          | Type      | Options                         |
| ------          | ----      | -------                         |
| name            | string    | null: false                     |
| explanation     | text      | null: false                     |
| condition_id    | integer   | null: false                     |
| postage_id      | integer   | null: false                     |
| area_id         | integer   | null: false                     |
| price           | integer   | null: false                     |
| delivery_id          | integer   | null:false                      |
| user            | references| null: false, foregin_key : true |
| category_id     | integer   | null: false                     |

- belongs_to :user
- has_many :comments
- has_one : purchases




## commets table
| Column  | Type    | Options                         |
| ------  | ----    | -------                         |
| item_id | integer | null: false, foregin_key : true |
| user_id | integer | null: false, foregin_key : true |
| comment | text    | null: false                      |

- belongs_to: item
- belongs_to: user


## purchases table
| Column  | Type       | Options                         |
| ------  | ----       | -------                         |
| user    | references | null :false, foregin_key : true |
| item    | references | null :false, foregin_key : true |                   
 
- belongs_to : user
- belongs_to : item
- has_one : address
