class Message < ApplicationRecord
  belongs_to :user
  #belongs_to :chatroom
  validates :body, presence: true

  #here is a query that executes in the message db table and we can call it in the chatroom controller to display only the latest 20 messages
  scope :custom_display, -> { order(:created_at).last(20) }
end
