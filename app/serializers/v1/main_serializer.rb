module V1
  class MainSerializer < ActiveModel::Serializer
    def format_time(time)
      time.strftime("%Y-%m-%d %H:%M:%S")
    end
  end
end
