class AddUserIdToSpalas < ActiveRecord::Migration[7.0]
  def change
    add_column :spalas, :user_id, :integer
  end
end
