Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      get 'save_short_url', to: 'urls#save_short_url', as: :save_short_url
    end
  end
end
