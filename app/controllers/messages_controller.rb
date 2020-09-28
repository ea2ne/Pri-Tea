class MessagesController < ApplicationController
  before_action :go_index, except: [:index, :show, :search]
  
  def index
    @messages = Message.includes(:user).order("created_at DESC")
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
    @comment = Comment.new
    @comments = @message.comments.includes(:user)

    # 参考サイト1
    # https://sadah.github.io/rails-training/ja/004_comments.html
    # @message = Message.includes(:user).find(params[:id])
    # @comments = @message.comments.includes(:user).all
    # @comment = @message.comments.build(user_id: current_user.id) if current_user


    # 参考サイト2
    # @comment = @message.comments.create(comment.params)
    # https://qiita.com/nojinoji/items/2034764897c6e91ef982
  end

  def search
    @messages = Message.search(params[:keyword])
  end

  private
  def message_params
    params.require(:message).permit(:grade, :subject, :text, :image, :user_id, :detail).merge(user_id: current_user.id)
  end

  def go_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end

