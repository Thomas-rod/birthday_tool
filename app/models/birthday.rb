class Birthday < ApplicationRecord

  belongs_to :friend

  validates :friend, :start, :age, presence: true
  validates :age, numericality: { only_integer: true }


  def start_time
    self.start ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end
