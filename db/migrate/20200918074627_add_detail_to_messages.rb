class AddDetailToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :detail, :text
  end
end
