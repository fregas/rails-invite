
class HomeController < ApplicationController
  before_filter :get_data

  def index
  end

  def submit
    @invitee.update_attributes params[:invitee]
    @invitee.save
    @invitee.responses << Response.new(:message => params[:message] ) if params[:message].present? || @invitee.responses.count === 0
    
    render :text => 'success'
  end

  def show_responses
    @responses = Response.all(:order => 'created_at DESC')
    render :layout => nil    
  end

  private 
  def get_data
    @invitee = Invitee.find_by_unique_id params[:id]
    @invitee.last_viewed_at = Time.now unless @invitee.nil?
    @answers = Answer.all
  end

end
