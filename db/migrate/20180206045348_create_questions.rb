class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :text
      t.integer :link_id

      t.timestamps
    end
  end
end
