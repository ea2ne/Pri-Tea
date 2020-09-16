class MessagesController < ApplicationController
  before_action :go_index, except: [:index, :show]
  
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    Message.create(message_params)
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
  end

  def edit
    @mesage = Message.find(params[:id])
  end

  def update
    message = Message.find(params[:id])
    message = update(message_params)
  end

  def show
    @message = Message.find(params[:id])
  end

  private
  def message_params
    params.require(:message).permit(:name, :grade, :subject, :text, :image)
  end

  def go_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end

# def go_index
#   unless user_signed_in?
#     redirect_to action: :index
#   end
# end