class Activity < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  scope :created_by, ->(creator_id) { where(creator_id: creator_id) }
end
