class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :score
      t.string :submission_type
      t.references :user, foreign_key: true
      t.integer :submission_id

      t.timestamps
    end
  end
end
