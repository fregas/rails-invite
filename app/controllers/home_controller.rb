
class HomeController < ApplicationController
  before_filter :get_data

  def index
  end

  def submit
  end

  private 
  def get_data
    @invitee = Invitee.find_by_unique_id params[:id]
    @answers = Answer.all
  end

end
