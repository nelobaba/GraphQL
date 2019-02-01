class Session < ApplicationRecord
    belongs_to :user

    # Randomly generated session key
    before_create do
        self.key = SecureRandom.hex(20)
    end 
end
