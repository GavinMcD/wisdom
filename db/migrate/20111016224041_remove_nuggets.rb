class RemoveNuggets < ActiveRecord::Migration
  def change
    drop_table :nuggets do |t|
      t.string  :audience
      t.string  :topic
      t.text    :body
      t.integer :user_id

      t.timestamps
    end
  end
end
