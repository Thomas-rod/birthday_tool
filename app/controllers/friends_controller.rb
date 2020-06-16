class FriendsController < ApplicationController
  def index
    @friends = policy_scope(Friend)
    today_birthday
  end

  def create
  end

  private

  def today_birthday
    @today_birthday = []
    policy_scope(Friend).each do |f|
      if f.birthday_date.day == Date.today.day && f.birthday_date.month == Date.today.month
        @today_birthday << f
      end
    end
    return @today_birthday
  end
end
