class SlotCreatorService

  SLOT_DURATION = 15 * 60

  attr_accessor :start_time, :end_time, :slots_required, :slot

  def initialize(params, slot)
    @slot = slot
    @start_time = params[:start_time].to_datetime
    @end_time = params[:end_time].to_datetime
    @slots_required = params[:total_capacity].to_i
  end

  def call
    max_slots = find_max_slots
    collection = []
    (1..max_slots).each do |slot_number|
      collection << { start_time: find_slot_start_time(slot_number),
               end_time: find_slot_end_time(slot_number),
               capacity: find_slot_capacity(max_slots, slot_number) }
    end

    slot.slot_collections.create(collection.reverse)
  end

  private

  def find_total_duration
    end_time.to_i - start_time.to_i
  end

  def find_max_slots
    duration = find_total_duration
    (slots_required * SLOT_DURATION) > duration ?  duration/SLOT_DURATION : slots_required
  end

  def find_slot_start_time(slot_number)
    format_time(find_time(slot_number))
  end

  def find_slot_end_time(slot_number)
    format_time(find_time(slot_number - 1))
  end

  def find_time(num)
    end_time.ago(num * SLOT_DURATION)
  end

  def find_slot_capacity(max_slots, slot_number)
    find_min_capacity, modulus = slots_required.divmod(max_slots)
    find_min_capacity + (modulus >= slot_number ? 1 : 0)
  end

  def format_time(time)
    time.strftime("%Y-%m-%d %H:%M:%S")
  end
end
