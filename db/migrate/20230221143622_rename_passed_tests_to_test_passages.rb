class RenamePassedTestsToTestPassages < ActiveRecord::Migration[6.1]
  def change
    rename_table :passed_tests, :test_passages
  end
end
