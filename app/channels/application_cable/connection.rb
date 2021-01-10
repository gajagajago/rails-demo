module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # identified_by :current_user
    #
    # def connect
    #   self.current_user = find_verified_user
    # end
    #
    # protected
    # def find_verified_user
    #   logger.add_tags 'ActionCable', cookies # to console
    #   if current_user = User.find_by(id: cookies.signed[:user_id])
    #
    #     logger.add_tags 'ActionCable', 'User found' # to console
    #
    #     current_user
    #   else
    #     message = "The user is not found. Connection rejected."
    #
    #     logger.add_tags 'ActionCable', message # to console
    #
    #     self.transmit error: message # this is what you wanted
    #
    #     reject_unauthorized_connection
    #   end
    # end
  end
end