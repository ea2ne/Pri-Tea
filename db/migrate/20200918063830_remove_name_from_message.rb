class RemoveNameFromMessage < ActiveRecord::Migration[6.0]
  def change
    remove_column :messages, :name, :string
  end
end
