require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  login_user

  describe "GET new" do
    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end
    it "renders :new template" do
      get :new
      expect(response).to render_template(:new)
    end
    it "assigns new Message to @message var" do
      get :new
      expect(assigns(:message)).to be_a_new(Message)
    end
  end
  describe "GET show" do
    let(:message) {FactoryGirl.create(:message)}
    it "renders show template" do
      get :show, id: message.id
      expect(response).to render_template(:show)
    end
    it "assigns requested message to @message" do
      get :show, id: message.id
      expect(assigns(:message)).to eq(message)
    end
    describe "POST create" do
      context "valid data" do
        it "has a 201 status code for a post create with AJAX" do
          xhr :post, :create, {message: FactoryGirl.attributes_for(:message)}
          expect(response.code).to eq('201')
          expect(request.path).to eq '/messages'
        end
        it "creates a new message in the database" do
          expect {
            xhr :post, :create, {message: FactoryGirl.attributes_for(:message)} 
          }.to change(Message, :count).by(1)
        end
      end
      context "invalid data" do

      end
    end

  end

end
