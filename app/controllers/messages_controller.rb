class MessagesController < ApplicationController
  before_action :go_index, except: [:index, :show]
  
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
    # コメント機能の実装時にコメントアウト
    @message = Message.find(params[:id])

    # 一時的に消してみる
    @comment = Comment.new
    @comments = @message.comments.includes(:user)

    # このサイトを参考
    # https://sadah.github.io/rails-training/ja/004_comments.html
    # @message = Message.includes(:user).find(params[:id])
    # @comments = @message.comments.includes(:user).all
    # @comment = @message.comments.build(user_id: current_user.id) if current_user



    # このサイトを見て、参考にしている途中
    # @comment = @message.comments.create(comment.params)
    # https://qiita.com/nojinoji/items/2034764897c6e91ef982
    
  end

  private
  def message_params
    params.require(:message).permit(:grade, :subject, :text, :image, :user_id).merge(user_id: current_user.id)
  end

  def go_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end

