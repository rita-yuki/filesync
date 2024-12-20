# プロジェクト名

このプロジェクトは書類管理システムです。ユーザーは書類を管理し、各書類の詳細情報を保存し、返却物件を管理できます。

## テーブル構造

### Usersテーブル

| カラム名           | データ型 | 制約        |
|-------------------|----------|------------|
| user_id           | integer  | PK         |
| user_name         | string   | null: false|
| encrypted_password| string   | null: false|
| created_at        | datetime |            |
| updated_at        | datetime |            |

### Association

- has_many :documents
- has_many :comments
- has_many :returns

### Documentsテーブル

| カラム名          | データ型 | 制約                           |
|------------------|----------|-------------------------------|
| document_id      | integer  | PK                            |
| category_id      | integer  | null: false, foreign_key: true|
| quantity         | integer  | null: false                   |
| received_date    | date     | null: false                   |
| customer_name    | string   | null: false                   |
| processing_dates | json     | null: false                   |
| user_id          | integer  | null: false, foreign_key: true|
| created_at       | datetime |                               |
| updated_at       | datetime |                               |

### Association
- has_many :returns
- belongs_to :category
- belongs_to :user
- belongs_to :status

### Commentsテーブル

| カラム名       | データ型   | 制約                            |
|---------------|------------|--------------------------------|
| comment_id    | integer    | PK                             |
| text          | string     | null: false                    |
| user_id       | integer    | null: false, foreign_key: true |
| document_id   | integer    | null: false, foreign_key: true |
| created_at    | datetime   |                                |
| updated_at    | datetime   |                                |

### Association
- belongs_to :user
- belongs_to :document

### Returnsテーブル

| カラム名        | データ型 | 制約                          |
|----------------|----------|--------------------------------|
| return_id      | integer  | PK                             |
| processed_date | date     | null: false                    |
| category_id    | integer  | null: false, foreign_key: true |
| quantity       | integer  | null: false                    |
| user_id        | integer  | null: false, foreign_key: true |
| return_due_date| date     | null: false                    |
| created_at     | datetime |                                |
| updated_at     | datetime |                                |

### Association
- belongs_to :document
- belongs_to :category
- belongs_to :user

### Categoriesテーブル

| カラム名      | データ型  | 制約                           |
|--------------|------------|--------------------------------|
| category_id  | integer    | PK                             |
| category_name| string     | null: false                    |
| created_at   | datetime   |                                |
| updated_at   | datetime   |                                |

### Association
- has_many :documents
- has_many :returns