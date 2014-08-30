class AlterLinks < ActiveRecord::Migration
  def change
    change_table :links do |t|
      t.belongs_to :user
    end
  end
end
