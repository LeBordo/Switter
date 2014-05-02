class Swit < ActiveRecord::Base
	validates :body, presence: true, length: { maximum: 140 }
	has_many :comments, :dependent => :delete_all
	has_many :sweets, :dependent => :delete_all
	has_many :sours, :dependent => :delete_all
	has_many :doortags, :dependent => :delete_all

end