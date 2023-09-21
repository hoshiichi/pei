class CreateSpalas < ActiveRecord::Migration[7.0]
  def change
    create_table :spalas do |t|
      t.string :name
      t.text :review
      t.string :image
      t.integer :star
      t.integer :overall


      t.timestamps
    end
  end
end
