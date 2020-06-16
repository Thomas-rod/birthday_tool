class FriendsController < ApplicationController
  def index
    @friends = policy_scope(Friend)
  end

  def create
  end
end
