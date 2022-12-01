module V1
  class SlotCollectionSerializer < ActiveModel::Serializer
    attributes :id, :start_time, :end_time, :capacity

    def initialize(slot_collections)
      @object = slot_collections
    end

    def call
      object.map do |sc|
        {
          id: sc.id,
          start_time: format_time(sc.start_time),
          end_time: format_time(sc.end_time),
          capacity: sc.capacity
        }
      end
    end

    def format_time(time)
      time.strftime("%Y-%m-%d %H:%M:%S")
    end
  end
end