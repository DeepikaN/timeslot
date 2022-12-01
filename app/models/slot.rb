class Slot < ApplicationRecord
  #include ActiveModel::Serializers::JSON

  has_many :slot_collections, dependent: :destroy

  scope :available, -> (args) { where('start_time = ? and end_time = ? and total_capacity = ?',
                                       args[:start_time], args[:end_time], args[:total_capacity])}

end
