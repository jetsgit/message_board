class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key "messages", "users", name: "messages_user_id_fk"
  end
end
