class AddResultToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :result, :integer
  end
end
