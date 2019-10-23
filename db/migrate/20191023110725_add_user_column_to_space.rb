class AddUserColumnToSpace < ActiveRecord::Migration[6.0]
  def change
    add_reference :spaces, :user, index: true
  end
end
