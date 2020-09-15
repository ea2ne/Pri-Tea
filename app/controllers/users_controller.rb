class UsersController < ApplicationController
  def show
    @user = cuurent_user
  end
end
