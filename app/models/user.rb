class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friends, dependent: :destroy
  has_many :birthdays, through: :friends
  has_one_attached :photo

  validates :email, uniqueness: true
  validates :first_name, :last_name, :birthday_date, presence: true

  def full_name
    return "#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end

  def birthday_of_the_month
    self.birthdays.select { |b| (b.start.month == Date.today.month && b.start.year == Date.today.year)}
  end

  def counter_birthday_of_the_month
    counter = 0
    self.birthdays.each do |b|
      counter += 1 if (b.start.month == Date.today.month && b.start.year == Date.today.year)
    end
    return counter
  end
end
