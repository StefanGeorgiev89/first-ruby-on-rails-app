class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

   def hello
    render html: "My first Bloger"
  end
end
