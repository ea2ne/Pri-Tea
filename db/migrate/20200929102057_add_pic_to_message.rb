class AddPicToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :pic, :binary
  end
end
