class UsersController < ApplicationController
  def show
    @user = current_user.name
    @messages = current_user.messages
  end
end
