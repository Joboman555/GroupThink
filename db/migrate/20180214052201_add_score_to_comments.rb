class AddScoreToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :score, :integer, default: 1
  end
end
