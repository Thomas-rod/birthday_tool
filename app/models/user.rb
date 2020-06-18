class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  GENDER = ["male", "female", "animal"]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friends, dependent: :destroy
  has_many :birthdays, through: :friends
  has_one_attached :photo

  validates :email, uniqueness: true
  validates :gender, inclusion: {in: GENDER }
  validates :first_name, :last_name, :birthday_date, presence: true

  before_save :profile_picture_placeholder

  #---------------------------------#
  #             CALLBACK            #
  #---------------------------------#
  def profile_picture_placeholder
    if self.gender == "male"
      self.photo_placeholder = random_male_photo
    elsif self.gender == "female"
      self.photo_placeholder = random_female_photo
    else
      self.photo_placeholder = define_animal(self)
    end
  end



  #---------------------------------#
  #              METHOD             #
  #---------------------------------#


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


  private

  def random_male_photo
    image_male = %w(001-man 003-delivery-man 004-man 008-man 010-man 012-boy 014-bell-boy 016-punk 021-man 025-man 028-man 029-man 031-man 032-man 034-man 035-chef 038-man 040-man)
    return image_male.shuffle[0]
  end

  def random_female_photo
    image_female = %w(002-woman 005-woman 006-nurse 007-woman 009-girl 011-girl 013-girl 015-girl 017-woman 018-woman 019-woman 020-woman 022-woman 023-woman 024-woman 026-woman 027-woman 030-woman 036-woman 037-woman 039-woman)
    return image_female.shuffle[0]
  end

end
