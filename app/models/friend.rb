class Friend < ApplicationRecord
  GENDER = ["male", "female", "animal"]
  NICKNAME = [["dad", "male"], ["mom","female"], ["brother","male"], ["sister","female"], ["oncle","male"], ["aunt","female"], ["stepfather","male"], ["stepmother","female"],["grandmother", "female"], ["grandfather", "male"], ["dog","animal"], ["cat","animal"], ["horse","animal"]]

  belongs_to :user

  validates :first_name, :last_name, :nickname, presence: true
  validates :gender, inclusion: {in: GENDER }
  validates :nickname, inclusion: {in: NICKNAME}

  before_create :gender_friend

  #---------------------------------#
  #              METHOD.            #
  #---------------------------------#

  def gender_friend
    self.gender = self.nickname[1]
  end
end
