class ContactsController < ApplicationController
  before_action :set_logined_term

  def index
    require "net/http"
    uri = URI.parse("http://localhost:3001/api/v1/contacts")
    response = Net::HTTP.get_response(uri)
    @contacts = JSON.parse(response.body)
  end

  private

  def set_logined_term
    @logined_term = User.includes([:year,:term,:year_term]).find(current_user.id)
  end
end
