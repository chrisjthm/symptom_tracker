class Post < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :symptom, presence: true, length: { maximum: 140 }
	validates :severity, presence: true
	validates :user_id, presence: true
end
