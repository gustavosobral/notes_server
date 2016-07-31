class Note
  include Mongoid::Document
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  field :title
  field :body
  field :status
  field :first_seen, type: DateTime

  validates :title, presence: true, length: { maximum: 80 }
  validates :body, presence: true
  validate  :status_validator

  def as_indexed_json(_ = {})
    as_json(
      only: [:title, :body]
    )
  end

  private
    def status_validator
      if !%w(active inactive draft).include?(status)
        errors.add(:status, 'invalid')
      end
    end
end
