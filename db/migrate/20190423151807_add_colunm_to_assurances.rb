class AddColunmToAssurances < ActiveRecord::Migration
  def change
   add_column :assurances, :user_id, :integer
  end
end
