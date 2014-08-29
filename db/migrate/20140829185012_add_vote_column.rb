class AddVoteColumn < ActiveRecord::Migration
  def change
    change_column :links, :votes, :integer, default: 0
  end
end
