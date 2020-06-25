class Friend < ApplicationRecord
  GENDER = ["male", "female", "animal"]
  NICKNAME = ["dad", "mom", "brother", "sister", "uncle", "aunt", "stepfather", "stepmother", "father-in-law", "mother-in-law","grandmother", "grandfather", "dog", "cat", "horse", "best-friend", "boy-friend", "girl-friend", "friend"]

  has_many :birthdays, dependent: :destroy
  has_one_attached :photo
  belongs_to :user

  validates :first_name, :last_name, :nickname, presence: true
  validates :gender, inclusion: {in: GENDER }
  validates :nickname, inclusion: {in: NICKNAME}

  after_save :birthday_creation
  before_save :profile_picture_placeholder

  #---------------------------------#
  #             CALLBACK            #
  #---------------------------------#
  def birthday_creation
    age = ((Date.today - self.birthday_date).to_i)/365
    counter = 0
    (100-age).times do |b|
      Birthday.create!(friend: self, age: (age + counter), start: Date.new((Date.today.year + counter), self.birthday_date.month, self.birthday_date.day))
        counter += 1
    end
  end

  def days_before_birthday
    birthdays_year_year_plus_one = self.birthdays.select{|b| b.start.year == Date.today.year || b.start.year == (Date.today.year + 1)}
    if birthdays_year_year_plus_one[0].start < Date.today
      return (birthdays_year_year_plus_one[1].start - Date.today).to_i
    else
      return (birthdays_year_year_plus_one[0].start - Date.today).to_i
    end
  end

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
  #              METHOD.            #
  #---------------------------------#

  def gender_she_or_he
    self.gender == "male" || self.gender == "animal" ? "he" : "she"
  end

  def friends_age
    age = ((Date.today - self.birthday_date).to_i)/365
    return age
  end

  def full_name
    return "#{self.first_name.capitalize} #{self.last_name.capitalize}"
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

  def define_animal(friend)
    if friend.nickname == "dog"
      return "dog"
    elsif friend.nickname == "cat"
      return "cat"
    else
      return "horse"
    end
  end

end
