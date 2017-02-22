require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  login_user
  before(:each) do
    @message = FactoryGirl.create :message
  end

  describe 'POST #create' do
    it 'saves a new comment to the database' do
      @comment_attributes = FactoryGirl.attributes_for(:comment, message_id: @message.id)
      expect {
        post :create, message_id: @message, comment: @comment_attributes 
      }.to change(Comment, :count).by(1)
    end
  end

end
