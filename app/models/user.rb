class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :nickname, presence: true
  validates :email, uniqueness: true


  has_many :users_evaluations
  has_many :evaluations, through: :users_evaluations

  has_one :user_detail
  accepts_nested_attributes_for :user_detail

  has_one :card

  protected

  def self.find_for_oauth(auth)
    user = User.find_by(email: auth.info.email)
    unless user
      user = User.create!(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        nickname:  auth.extra.raw_info.name,
        password: Devise.friendly_token[0, 20]
      )
    end
    user
  end
end
