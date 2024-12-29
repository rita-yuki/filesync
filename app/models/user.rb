class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :employee_number, presence: true, uniqueness: true

  enum role: { 営業担当者: 0, 事務担当者: 1, 管理者: 2 }
end
