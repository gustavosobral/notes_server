FactoryGirl.define do
  factory :note do
    title 'My First Note'
    body '<h1>This is a valid body!</h1>'
    status 'active'
    first_seen { 1.month.ago }
  end

  factory :note_title_greater, parent: :note do
    title 'Lorem ipsum dolor sit amet, consectetur
           adipiscing elit. Integer at lorem at posuere.'
  end
end
