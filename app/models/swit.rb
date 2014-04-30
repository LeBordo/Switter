class Swit < ActiveRecord::Base
	validates :body, presence: true, length: { maximum: 140 }
	has_many :comments
	has_many :sweets
end