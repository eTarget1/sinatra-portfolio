class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :fullname, nil: false
      t.integer :phone, nil: false
      t.string :email, nil: false
      t.text :message, nil: false
    end
  end
end


