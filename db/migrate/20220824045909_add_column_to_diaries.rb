class AddColumnToDiaries < ActiveRecord::Migration[6.1]
  def change
    add_column :diaries, :kept_at, :datetime, after: :body
  end
end
