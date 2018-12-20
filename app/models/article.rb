class Article < ApplicationRecord
  belongs_to :author

  validates_presence_of :subject, :description, :catagory
end
