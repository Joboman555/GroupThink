class AddScoreToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :score, :integer, default: 1
  end
end
