# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :text
#

class Post < ApplicationRecord
  validates :body, presence: true, length: { minimum: 5 }
  validate :has_sunny_in_body

  def has_sunny_in_body
    unless self.body.include? "Sunny"
      errors[:body] = "Doesn't have a reference to Sunny!"
    end
  end
end
