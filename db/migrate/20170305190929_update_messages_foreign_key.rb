class UpdateMessagesForeignKey < ActiveRecord::Migration
  def change
    remove_foreign_key :messages, :users
    add_foreign_key "messages", "users", name: "messages_user_id_fk", on_delete: :cascade
  end
end
