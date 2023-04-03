class Message < ApplicationRecord
    belongs_to :user
    validates :reciver_id,:content,:user_id, presence: true
    after_create_commit { broadcast_append_to "messages" }
end
