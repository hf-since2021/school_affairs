# テーブル設計

## users テーブル

| Column              | Type       | Options                   | Description    |
| ------------------- | ---------- | ------------------------- | -------------- |
| name                | string     | null: false               | ログインID      |
| year_term           | references | foreign_key: true         | ログイン年度学期  |
| (4-columns)         | (various)  | (various)                 | (from devise)   |

### Association

- has_many   :users_role
- belongs_to :year_term
- has_one    :year,  through: :year_term
- has_one    :term,  through: :year_term

## roles テーブル

| Column              | Type       | Options                   | Description    |
| ------------------- | ---------- | ------------------------- | -------------- |
| name                | string     |                           | 権限名          |
| (2-columns)         | (various)  | (various)                 | (from rolify)  |

### Association
- has_and_belongs_to_many :users, :join_table => :users_roles

## users_roles テーブル

| Column              | Type       | Options                   | Description    |

### Association
- 

## years テーブル

| Column              | Type       | Options                   | Description    |

### Association
- 

## terms テーブル

| Column              | Type       | Options                   | Description    |

### Association
- 

## year_terms テーブル

| Column              | Type       | Options                   | Description    |

### Association
- 

##  テーブル