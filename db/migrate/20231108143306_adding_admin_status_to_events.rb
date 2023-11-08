class AddingAdminStatusToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :admin, foreign_key: { to_table: :users }
  end
end
