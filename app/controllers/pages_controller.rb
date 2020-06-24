class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def onboarding
    @user = current_user
    @profil = Profil.new()
  end
end
