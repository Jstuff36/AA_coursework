class Changecolumn < ActiveRecord::Migration
  def change
    rename_column :comments, :comment, :body
  end
end
