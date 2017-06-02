require "dragonfly"

Dragonfly.app.configure do
  plugin :imagemagick

  secret "2fdcea23691d8505d59eb30b9bebbc3e01716ae3b9a2e36449359c37c8f7de8c"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join("public/system/dragonfly", Rails.env),
    server_root: Rails.root.join("public")
end

Dragonfly.logger = Rails.logger

Rails.application.middleware.use Dragonfly::Middleware
