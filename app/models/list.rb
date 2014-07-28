class List < ActiveRecord::Base
  has_many :tasks
  
  validate :name, presence: true
end
