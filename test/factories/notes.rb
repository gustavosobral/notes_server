FactoryGirl.define do
  factory :note do
    body '<h1>This is a valid body!</h1>'
    first_seen { 1.month.ago }
  end

  factory :note_body_blank, parent: :note do
    body ''
  end
end
