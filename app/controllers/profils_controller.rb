class ProfilsController < ApplicationController
  def create
    authorize Profil
    @profil = Profil.new(profil_params)
    @profil.user = current_user
    if @profil.save
      redirect_to new_friend_path
    else
      redirect_to onboarding_path, notice: 'Something went wrong, please fullfill informations'
    end
  end

  private

  def profil_params
    params.require(:profil).permit(:first_name, :last_name, :gender, :birthday_date, :photo_placeholder, :photo)
  end
end
