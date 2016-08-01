class Note
  include Mongoid::Document
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  field :title
  field :body
  field :status
  field :first_seen, type: DateTime
  field :views, type: Integer

  validates :title, presence: true, length: { maximum: 80 }
  validates :body, presence: true
  validate  :status_validator
  validate  :first_seen_validator

  def initialize(attrs = nil)
    super(attrs)
    self.views = 0
  end

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

    def first_seen_validator
      if (first_seen != first_seen_was) && (!first_seen_was.blank?)
        errors.add(:first_seen, "can't be updated")
      end
    end
end
