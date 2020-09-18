class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @user = user.name
    @messages = user.messages
  end
end
