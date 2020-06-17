class Friend < ApplicationRecord
  GENDER = ["male", "female", "animal"]
  NICKNAME = ["dad", "mom", "brother", "sister", "oncle", "aunt", "stepfather", "stepmother", "father-in-law", "mother-in-law","grandmother", "grandfather", "dog", "cat", "horse", "best-friend", "boy-friend", "girl-friend", "friend"]

  has_many :birthdays, dependent: :destroy
  has_one_attached :photo
  belongs_to :user

  validates :first_name, :last_name, :nickname, presence: true
  validates :gender, inclusion: {in: GENDER }
  validates :nickname, inclusion: {in: NICKNAME}


  after_create :birthday_creation

  # before_create :gender_friend

  #---------------------------------#
  #              METHOD.            #
  #---------------------------------#
  def birthday_creation
    age = ((Date.today - self.birthday_date).to_i)/365
    counter = 0
    (100-age).times do |b|
      Birthday.create!(friend: self, age: (age + counter), start: Date.new((Date.today.year + counter), self.birthday_date.month, self.birthday_date.day))
        counter += 1
    end
  end
  # def gender_friend
  #   self.gender = self.nickname[1]
  # end

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

end
