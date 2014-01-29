class Store < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :name, :user, :slug
  validates_uniqueness_of :slug

end