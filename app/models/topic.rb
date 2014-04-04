class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 20 }
  validates :forum, presence: true
  validates :user, presence: true
end
