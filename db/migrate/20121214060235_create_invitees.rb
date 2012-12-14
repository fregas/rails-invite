class CreateInvitees < ActiveRecord::Migration
  def change
    create_table :invitees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :answer_id
      t.integer :guests
      t.datetime :sent_invite_at

      t.timestamps
    end
  end
end
