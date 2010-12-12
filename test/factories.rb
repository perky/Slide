

Factory.define :user do |u|
  u.sequence(:username) { |n| "user#{n}" }
  u.sequence(:email)    { |n| "user#{n}@gmail.com" }
  u.password            "foobar1"
end

Factory.define :ForumThread do |u|
  u.title "Cats"
  u.description "about cats."
  u.association :user
end

Factory.define :ForumPost do |u|
  u.association :user
  u.association :ForumThread
end