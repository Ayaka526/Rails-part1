Rails.application.routes.draw do
  get "/" =>"blogs#top"

   resources :blogs

end