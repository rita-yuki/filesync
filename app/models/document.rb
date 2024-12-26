class Document < ApplicationRecord
 # belongs_to :user

  scope :order_by_start_date, -> {
    # 手続き日の最初の日付で並べ替えるスコープ
    order(:start_date)
  }
end