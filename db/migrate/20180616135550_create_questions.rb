class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references(:post, foreign_key: true)
      t.string(:title, null: false)
      t.string(:answer, null: false)

      t.timestamps
    end
  end
end
