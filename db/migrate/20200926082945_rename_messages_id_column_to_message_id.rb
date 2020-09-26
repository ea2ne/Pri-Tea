class RenameMessagesIdColumnToMessageId < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :messages_id, :message_id
  end
end
