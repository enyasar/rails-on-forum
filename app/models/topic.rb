class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum
  has_many :comments, dependent: :destroy
  default_scope {order 'created_at DESC'}

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 20 }
  validates :forum, presence: true
  validates :user, presence: true
end
