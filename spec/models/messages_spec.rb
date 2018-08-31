require 'rails_helper'
RSpec.describe Message, type: :model do
  describe "create" do
    context "can save" do
      it "can save with text" do
        message = build(:message, image: nil)
        expect(message).to be_valid
      end
      it "can save with image" do
        expect(build(:message, text: nil)).to be_valid
      end
      it "can save with text and image" do
        expect(build(:message)).to be_valid
      end
    end
    context "can't save" do
      it "can't save without text and image" do
        message = build(:message, text: nil, image: nil)
        message.valid?
        expect(message.errors[:text]).to include("を入力してください")
      end
      it "can't save without group_id" do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group]).to include("を入力してください")
      end
      it "can't save without user_id" do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user]).to include("を入力してください")
      end
    end
  end
end
