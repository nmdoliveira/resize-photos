Rails.application.routes.draw do
  resources :photos, only: :index, defaults: { format: :json }

  get "photos/:uid", as: :photo,
    to: Dragonfly.app.endpoint { |params, app|
      image = app.fetch(params[:uid])
      params[:size] ? image.thumb(params[:size]) : image
    }
end
