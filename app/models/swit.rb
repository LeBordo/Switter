class Swit < ActiveRecord::Base
	validates :body, presence: true, length: { maximum: 140 }
end