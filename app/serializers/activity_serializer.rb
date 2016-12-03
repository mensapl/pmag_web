class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :accepted, :start_time, :end_time, :title, :description
end
