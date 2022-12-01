Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      match 'available_slots' => 'slots_api#available_slots', via: :post
    end
  end
end
