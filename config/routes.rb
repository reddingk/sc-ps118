Rails.application.routes.draw do

#Gerald
  root 'gerald#index'

  get 'gerald/arnold'

  get 'gerald/sid'
  
  get 'gerald/construction'

#Jada
    get 'jada/index'
    get 'jada-voice' => 'jada/index'

#Brainy
  get 'brainy/index'

  get 'brainy/eugene'
  resources :sfiles
  
  get 'brainy/download' 
  resources :sfiles
  
  get 'brainy/view' 
  resources :sfiles

#User Managament
  get 'user_manag/index'
  get 'UserManagement'  => 'users#index'
  get 'users/new'
  get 'users/edit' 
  get 'users/updatehome'
  get 'users/settings' 
  
#Sessions
  get 'sessions/new'
  get    'login' => 'sessions#new'
  post   'login' => 'sessions#create'
  get    'logout' => 'sessions#destroy'
  resources :users
  
#Devices
  get 'devices/new'
  
  get 'adduserdevice' => 'devices#new'
  resources :devices

#Sfiles
  get 'sfiles/new'

  post 'sfiles/create'

  get 'sfiles/destroy'
  
  #get "/private/uploads/sfile/syncefile/:userid/:sfile", :controller => "brainy", :action => "download"
  get "/private/uploads/sfile/syncefile/:userid/:sfile" => 'brainy#download'
  resources :sfiles
  
end
