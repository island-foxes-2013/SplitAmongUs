class Group < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  validates :name, presence: true
end
