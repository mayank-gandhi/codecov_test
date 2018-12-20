class Author < ApplicationRecord
  has_many :articles

  validates_presence_of :name, :email, :password
  validates :email, uniqueness: { case_sensitive: false }
end
