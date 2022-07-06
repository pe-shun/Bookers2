class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

  ## 本の名前を保存するカラム
      t.string :body
      ## タイトル
      t.string :title

      t.integer :user_id

      t.timestamps




    end
  end
end
