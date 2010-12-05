require 'pusher'
require 'bb-ruby'

Pusher.app_id = '3004'
Pusher.key = '8a498c9f2919fe85d8e7'
Pusher.secret = '7e303231f243a2e63819'

class ApplicationController < ActionController::Base
  include ControllerAuthentication
  include ControllerForum
  protect_from_forgery
end
