class AddLastViewedAt < ActiveRecord::Migration
  def change
    add_column :invitees, :last_viewed_at, :datetime 
  end
end
