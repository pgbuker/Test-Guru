class ChangeDefaultValueForLevelAndCorrect < ActiveRecord::Migration[6.1]
  # def change
  # end
  def up
    change_column_default :answers, :correct, false 
    change_column_default :tests, :level, 0  
  end

  def down
    change_column_default :answers, :correct, true
    change_column_default :tests, :level, nil
  end
end
