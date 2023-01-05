class AddAuthorToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :author_id, :integer
    add_foreign_key :questions, :users, column: :author_id
  end
end
