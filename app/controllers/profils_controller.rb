class ProfilsController < ApplicationController
  def create
    authorize Profil
    @profil = Profil.new(profil_params)
    @profil.birthday_date = Date.new(params[:profil]["birthday_date(1i)"].to_i, params[:profil]["birthday_date(2i)"].to_i, params[:profil]["birthday_date(3i)"].to_i)
    @profil.first_name = @profil.first_name.capitalize
    @profil.last_name = @profil.last_name.capitalize
    @profil.user = current_user
    if @profil.save
      redirect_to new_friend_path, notice: "Well done ! Your profil have been completed"
    else
      redirect_to onboarding_path, flash[:profil_errors] = @profil.errors.messages
    end
  end

  private

  def profil_params
    params.require(:profil).permit(:first_name, :last_name, :gender, :birthday_date, :photo_placeholder, :photo)
  end
end
