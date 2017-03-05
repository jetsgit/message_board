class UpdateCommentsForeignKey < ActiveRecord::Migration
  def change
    remove_foreign_key :comments, :users
    add_foreign_key "comments", "users", name: "comments_user_id_fk", on_delete: :cascade
            
  end
end
