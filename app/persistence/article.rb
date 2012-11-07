require 'active_model'
require 'mongoid'
module Persistence
  class Article
    include Mongoid::Document

    field :author
    field :body
    field :title

    validates :title, presence: true, uniqueness: true
    validates :body, presence: true
    validates :author, presence: true
  end
end
