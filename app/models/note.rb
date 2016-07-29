class Note
  include Mongoid::Document
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  field :body
  field :first_seen, type: DateTime

  validates :body, presence: true

  def as_indexed_json(_ = {})
    as_json(
      only: [:body]
    )
  end
end
