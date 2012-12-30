class AddResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :invitee_id
      t.string :message

      t.timestamps
    end
  end
end
