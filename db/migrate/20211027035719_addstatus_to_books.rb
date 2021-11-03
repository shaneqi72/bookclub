class AddstatusToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :status, :string
  end
end
