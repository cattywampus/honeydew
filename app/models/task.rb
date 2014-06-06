require 'elasticsearch/model'

class Task < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  enum status: [ :todo, :in_progress, :done ]

  validates :title, presence: true
end
