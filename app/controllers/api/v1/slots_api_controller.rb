class Api::V1::SlotsApiController < ApplicationController

  def available_slots
    begin
      validate_params
      slot = Slot.available(slot_params).last
      if !slot
        slot = Slot.create(slot_params)
        SlotCreatorService.new(params, slot).call
      end
      render json: serialized_response(slot)
    rescue Exception => e
      response = { success: false, message: e.message }
      response.merge!(code: e.code) if e.class == ApiException
      render json: response
    end
  end

  private

  def slot_params
    params.permit(:start_time, :end_time, :total_capacity)
  end

  def validate_params
    if params[:start_time].nil? || params[:start_time] < Time.now
      raise ApiException.new(101, "Start time: ")
    elsif params[:end_time].nil? || params[:end_time] < Time.now
      raise ApiException.new(101, "End time: ")
    elsif params[:start_time] >= params[:end_time]
      raise ApiException.new(104)
    elsif params[:total_capacity].to_i == 0
      raise ApiException.new(101, "Total Capacity: ")
    elsif ApiException.new("").valid_time_span?(params)
      raise ApiException.new(103)
    end
  end

  def serialized_response(slot)
    V1::SlotSerializer.new(slot).call
  end
end
