class Invitee < ActiveRecord::Base
  belongs_to :answer
  after_initialize :do_init

  def do_init
    self.guests = 1
    self.unique_id = rand(36**8).to_s(36) 
  end

  def full_name
    self.first_name + ' ' + self.last_name
  end

end
