module V1
  class SlotSerializer < MainSerializer
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
  end
end
