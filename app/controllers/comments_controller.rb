class CommentsController < ApplicationController
  before_action :find_message, only: [:create, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def create
    @comment = @message.comments.create(comment_params)
    @comment.user_id = current_user.id if current_user
    @comment.save

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @message, notice: 'Comment was successfully created.'   }
        format.json { render action: 'show', status: :created, location: @message   }
        format.js {render action: 'show', location: @message}
      else
        format.html { render action: 'new'   }
        format.json { render json: @comment.errors, status: :unprocessable_entity   }
        format.js   { render json: @comment.errors, status: :unprocessable_entity   }
      end
    end

    if @comment.save 
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end


  def find_message
    @message = Message.find(params[:message_id])
  end
end
