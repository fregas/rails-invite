class AddUniqueIdToInvitee < ActiveRecord::Migration
  def change
    add_column :invitees, :unique_id, :string
  end
end
