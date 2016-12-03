class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable

  has_one :gathering_entry
  has_many :created_activities, foreign_key: :creator_id, class_name: 'Activity'
end
