class ApplicationController < ActionController::Base
  def hello
    # render html directly
    render html: 'Hello world'
  end
end
