class Document < ApplicationRecord
  belongs_to :created_by, class_name: "User"

  validates :body, presence: true
  validates :created_by_id, presence: true
end
