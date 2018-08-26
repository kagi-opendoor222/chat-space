class Group < ApplicationRecord
  #validation
  validates :name, presence: true

  #association
  has_many :group_users
  has_many :users,    through: :group_users
  has_many :messages

  def show_latest_message
    if self.messages.last
      self.messages.last.text.present? ? self.messages.last.text : "画像が投稿されています。"
    else
      "メッセージはまだありません。"
    end
  end
end
