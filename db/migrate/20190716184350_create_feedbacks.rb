class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.string :url
      t.string :nickname
      t.string :text

      t.timestamps
    end
  end
end
