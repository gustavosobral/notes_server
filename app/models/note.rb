class Note
  include Mongoid::Document

  field :body
  field :first_seen, type: DateTime

  validates :body, presence: true
end
