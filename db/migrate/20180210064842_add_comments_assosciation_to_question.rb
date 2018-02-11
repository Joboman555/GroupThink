class AddCommentsAssosciationToQuestion < ActiveRecord::Migration[5.1]
  def self.up
      add_column :comments, :question_id, :integer
      add_index 'comments', ['question_id'], :name => 'index_question_id'
  end

  def self.down
      remove_column :comments, :question_id
  end
end
