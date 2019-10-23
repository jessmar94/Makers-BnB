class CreateUsersTable < ActiveRecord::Migration[6.0]
  # def up
  #   create_table :users do |t|
  #     t.string :username
  #     t.string :email
  #     t.string :password
  #     t.datetime :created_at
  #   end
  # end
  #
  # def down
  #   drop_table :users
  # end

  def change
    create_table :users do |t|
      t.has_many :spaces
      t.has_many :requests 
      t.string :username
      t.string :email
      t.string :password
      t.datetime :created_at
    end
  end

end
