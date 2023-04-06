class User < ApplicationRecord
    has_many :messages

    has_one_attached :image
    
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    def active_for_authentication?
      super && !approved?
    end

    def inactive_message
      approved?? :approved : super
    end
end
