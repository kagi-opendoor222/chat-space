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
    let(:params){ {user_id: user.id, group_id: group.id, message: attributes_for(:message)} }
    context "log in" do
      before do
        login user
      end
      context "can save" do
        subject {
          post :create,
          params: params
        }
        it "count up message" do
          expect{ subject }.to change(Message, :count).by(1)
        end
        it "redirect to :index" do
          expect( subject ).to redirect_to(group_messages_path(group))
        end
      end
      context "can't save" do
        let(:invalid_params){ {user_id: user.id, group_id: group.id, message: {text: nil, image: nil}} }
        subject {
          post :create,
          params: invalid_params
        }
        it "does not count up" do
          expect{ subject }.not_to change(Message, :count)
        end
        it "render :index" do
          expect( subject ).to render_template(:index)
        end
      end
    end
    context "not log in" do
    end
  end
end
