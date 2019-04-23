class CreateAssurances < ActiveRecord::Migration
  def change
    create_table :assurances do |t|
      t.string :owner
      t.integer :phone
      t.string :model
      t.string :immatriculation
      t.string :color
      #t.integer :user_id
      t.timestamps null: false
    end
  end
end
