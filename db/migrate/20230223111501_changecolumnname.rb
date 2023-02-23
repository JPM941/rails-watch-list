class Changecolumnname < ActiveRecord::Migration[7.0]
  def change
    rename_column :movies, :overwiew, :overview
  end
end
