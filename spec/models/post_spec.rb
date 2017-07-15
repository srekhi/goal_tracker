# ==Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :text
#

require 'rails_helper'

RSpec.describe Post, type: :model do
    it { should validate_presence_of :body }
    it { should validate_length_of(:body).is_at_least(5) }
    it 'should have reference to sunny' do
      post = Post.new("hi all! excited to be here")
      expect(post).to be_invalid
      expect(post.errors[:base]).to include("Doesn't have a reference to Sunny!")
    end
end
