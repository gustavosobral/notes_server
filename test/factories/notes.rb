FactoryGirl.define do
  factory :note do
    title 'My First Note'
    body '<h1>This is a valid body!</h1>'
    first_seen { 1.month.ago }
  end

  factory :note_title_blank, parent: :note do
    title ''
  end

  factory :note_body_blank, parent: :note do
    body ''
  end

  factory :note_title_greater, parent: :note do
    title 'Lorem ipsum dolor sit amet, consectetur
           adipiscing elit. Integer at lorem at posuere.'
  end
end
