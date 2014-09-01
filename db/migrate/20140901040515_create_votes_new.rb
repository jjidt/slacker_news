class CreateVotesNew < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :link

      t.timestamps
    end
  end
end
