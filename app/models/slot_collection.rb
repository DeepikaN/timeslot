class SlotCollection < ApplicationRecord

  #include ActiveModel::Serializers::JSON

  belongs_to :slot

end
