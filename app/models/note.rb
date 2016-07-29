class Note
  include Mongoid::Document

  field :body
  field :first_seen, type: Date

  validates :body, presence: true
end
