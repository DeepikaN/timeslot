module V1
  class SlotSerializer < ActiveModel::Serializer
    attributes :id, :start_time, :end_time, :total_capacity

    def initialize(slot)
      @object = slot
    end

    def call
      {
        id: object.id,
        start_time: format_time(object.start_time),
        end_time: format_time(object.end_time),
        total_capacity: object.total_capacity,
        slot_collections: SlotCollectionSerializer.new(object.slot_collections).call

      }
    end

    def format_time(time)
      time.strftime("%Y-%m-%d %H:%M:%S")
    end
  end
end