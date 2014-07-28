require 'elasticsearch/model'

class Task < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :list

  enum status: [ :todo, :in_progress, :done ]

  validates :list, presence: true
  validates :title, presence: true
end
