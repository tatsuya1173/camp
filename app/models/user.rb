class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts,dependent: :destroy
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true
end
