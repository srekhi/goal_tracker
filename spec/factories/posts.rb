# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :text
#  author     :string
#

FactoryGirl.define do
  factory :post do
    body 'Sunny rocks!'

    factory :invalid_post do
      body 'rocks!'
      author 'sunny'
    end
  end
end
