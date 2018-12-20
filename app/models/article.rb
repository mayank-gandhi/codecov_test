class Article < ApplicationRecord
  belongs_to :author, optional: :true

  validates_presence_of :subject, :description, :catagory
end
