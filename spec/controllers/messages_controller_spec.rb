require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  login_user
  describe "GET index" do
    it "renders index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end
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
  end
  describe "POST create" do
    context "valid data" do
      subject { xhr :post, :create, {message: FactoryGirl.attributes_for(:message)}  }
      it "has a 201 status code for a post create with AJAX" do
        xhr :post, :create, {message: FactoryGirl.attributes_for(:message)}
        expect(response.code).to eq('201')
        expect(request.path).to eq '/messages'
      end
      it "creates a new message in the database" do
        expect {
          subject
        }.to change(Message, :count).by(1)
      end
      it "renders the index template" do
        expect(subject).to render_template("index")
      end
    end
    context "invalid data" do
      subject { xhr :post, :create, {message: FactoryGirl.attributes_for(:message, title: '')}  }
      it "does not render a messages/new template" do
        expect(subject).to_not render_template("messages/hew")
      end
      it "does not create a new message in database" do
        expect {
          subject
        }.not_to change(Message, :count)
      end
    end
  end
  describe "GET edit" do
    let(:message) {FactoryGirl.create(:message)}
    # For some reason, below does not work with expect(assigns)
    # subject {FactoryGirl.create(:message)}
    it 'renders :edit template' do
      get :edit, id: message
      expect(response).to render_template(:edit)
    end
    it 'assigns requested message to the template' do
      get :edit, id: message
      expect(assigns(:message)).to eq( message)
    end
  end

end
