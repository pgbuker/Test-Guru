class AddNameSurNameEmailNullConstraintToUser < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:users, :name, false)
    change_column_null(:users, :surname, false)
    change_column_null(:users, :email, false)
  end
end
