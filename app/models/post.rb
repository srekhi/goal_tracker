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

class Post < ApplicationRecord
  validate :has_sunny_in_body
  validates :body, presence: true, length: { minimum: 7 }
  validates :author, presence: true 

  def has_sunny_in_body
    unless self.body && self.body.include?("Sunny")
      errors[:body] << "Doesn't have a reference to Sunny!"
    end
  end
end
