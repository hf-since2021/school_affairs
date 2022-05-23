class TermsController < ApplicationController
  # before_action :authenticate_user! #(-> application_controller)
  before_action :set_logined_term

  def index
    @terms = Term.all.order("terms.code ASC")
  end

  def new
    @terms = Term.all.order("terms.code ASC")
    @term = Term.new
  end

  def create
    Term.create(term_params)
    redirect_to action: :index
  end

  private

  def set_logined_term
    @logined_term = User.includes([:year,:term,:year_term]).find(current_user.id)
  end

  def term_params
    params.require(:term).permit(:code, :name)
  end
end
