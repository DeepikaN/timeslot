module V1
  class SlotCollectionSerializer < MainSerializer
    attributes :id, :slot_id, :start_time, :end_time, :capacity

    def initialize(slot_collections)
      @object = slot_collections
    end

    def call
      object.map do |sc|
        {
          id: sc.id,
          slot_id: sc.slot_id,
          capacity: sc.capacity,
          start_time: format_time(sc.start_time),
          end_time: format_time(sc.end_time)
        }
      end
    end
  end
end
