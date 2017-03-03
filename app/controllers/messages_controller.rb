class MessagesController < ApplicationController

  before_action :find_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @messages = Message.page(params[:page]).order(created_at: :desc)
    @message = Message.new
  end

  def new
    @message = Message.new
  end

  def create
    @message = current_user.messages.build(message_params)
    respond_to do |format|
      if @result = @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.'  }
        format.json { render action: 'show', status: :created, location: @message  }
        format.js   { render action: 'index', status: :created, location: @message  }
      else
        format.html { render action: 'new'  }
        format.json { render json: @message.errors, status: :unprocessable_entity  }
        format.js   { render json: @message.errors , status: :unprocessable_entity  }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully created.'   }
        format.json { render action: 'show', status: :updated, location: @message   }
        format.js   { render action: 'show', status: :updated, location: @message   }
      else
        format.html { render action: 'edit'   }
        format.json { render json: @message.errors, status: :unprocessable_entity   }
        format.js   { render json: @message.errors, status: :unprocessable_entity   }
      end
    end
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html {redirect_to messages_url}
      format.js {redirect_to messages_url}
      format.json {head :no_content}
    end
  end

  private

  def message_params
    params.require(:message).permit(:title, :content)
  end

  def find_message
    @message = Message.find(params[:id])
  end
end
