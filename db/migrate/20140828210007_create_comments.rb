class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :link
      t.string :name
      t.text :text

      t.references :commentable, polymorphic: true
    end
  end
end
