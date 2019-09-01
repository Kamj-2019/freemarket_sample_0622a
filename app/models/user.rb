class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 8 }
  validates :email, uniqueness: true


  has_many :users_evaluations
  has_many :evaluations, through: :users_evaluations

  has_one :user_detail
  accepts_nested_attributes_for :user_detail
end
