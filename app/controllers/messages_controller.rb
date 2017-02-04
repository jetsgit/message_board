class MessagesController < ApplicationController

  before_action :find_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all.order(created_at: :desc)
  end

  def new
    if current_user
      @message = current_user.messages.build
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      redirect_to @message
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to @message
    else
      render 'edit'
    end
  end

  def destroy
    @message.destroy
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:title, :content)
  end

  def find_message
    @message = Message.find(params[:id])
  end
end
