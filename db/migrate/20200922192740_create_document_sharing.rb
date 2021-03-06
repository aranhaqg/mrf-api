class CreateDocumentSharing < ActiveRecord::Migration[6.0]
  def change
    create_table :document_sharings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :document, null: false, foreign_key: true
      t.boolean :created_by_user, null: false, default: false

      t.timestamps
    end
  end
end
