class FriendsController < ApplicationController
  def index
    @friends = policy_scope(Friend.paginate(:page => params[:page], :per_page => 6))
    @friend = Friend.new()
    today_birthday
    @birthdays = birthday_scope
    @birthday_of_the_month = birthday_of_the_month
  end

  def new
    authorize Friend
    @user = current_user
    @profil = @user.profil
    @friend = Friend.new();
  end

  def create
    authorize Friend
    @friend = Friend.new(friend_params)
    @friend.user = current_user
    define_gender(@friend)
    if @friend.save
      redirect_to friends_path, notice: "Youpi ! #{@friend.first_name} have been added 🚀"
    else
      redirect_to friends_path, alert: "Aïe, something went wrong..."
    end
  end

  private

  def friend_params
    params.require(:friend).permit(:first_name, :last_name, :gender, :nickname, :birthday_date, :comment, :user, :reminder_previous_day, :reminder_today_morning, :reminder_today_noon, :reminder_today_night, :photo)
  end

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

  def define_gender(friend)
    nickname = friend.nickname
    male = %w(dad brother uncle stepfather father-in-law grandfather best-friend boy-friend friend)
    female = %w(mom sister aunt stepmother mother-in-law grandmother girl-friend)
    if male.include?(nickname)
      friend.gender = "male"
    elsif female.include?(nickname)
      friend.gender = "female"
    else
      friend.gender = "animal"
    end
  end
end
