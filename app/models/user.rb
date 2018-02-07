##
# Base authenticable model
class User < ApplicationRecord
  ##
  # Include devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  ##
  # Overrides devise mailer to send through a Job (async)
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
