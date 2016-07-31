class Note
  include Mongoid::Document
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  field :title
  field :body
  field :first_seen, type: DateTime

  validates :title, presence: true, length: { maximum: 80 }
  validates :body, presence: true

  def as_indexed_json(_ = {})
    as_json(
      only: [:body]
    )
  end
end
