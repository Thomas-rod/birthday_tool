class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  validates :email, uniqueness: true
  validates :first_name, :last_name, :birthday_date, presence: true

  def full_name
    return "#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end
end
