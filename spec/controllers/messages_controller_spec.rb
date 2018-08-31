require 'rails_helper'

describe MessagesController do
  let(:user){ create(:user) }
  let(:group){ create(:group) }
  describe "GET #index" do
    context "log in" do
      before do
        login user
        get :index, group_id: group.id
      end
      it "assigns @message" do
        expect(assigns(:message)).to be_a_new(Message)
      end
      it "assigns @group" do
        expect(assigns(:group)).to eq group
      end
      it "renders :index template" do
        expect(response).to render_template :index
      end
    end
    context "not log in" do
      before do
        get :index, group_id: group.id
      end
      it "redirects to sign_up" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
  describe "POST #create" do
  end
end
