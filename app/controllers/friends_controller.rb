class FriendsController < ApplicationController
  def index
    @friends = policy_scope(Friend.paginate(:page => params[:page], :per_page => 6))
    today_birthday
    @birthdays = birthday_scope
    @birthday_of_the_month = birthday_of_the_month
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

  def birthday_of_the_month
    current_user.birthdays.select { |b| (b.start.month == Date.today.month && b.start.year == Date.today.year)}.sort_by(&:start)
  end

  def birthday_scope
    current_user.birthdays
  end
end
