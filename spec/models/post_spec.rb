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
  describe 'validations' do
    it { should validate_presence_of :body }
    it { should validate_length_of(:body).is_at_least(7) }
    it { should validate_presence_of :author }
  end
  describe 'post content' do
    it 'should check for a reference to sunny' do
      post = Post.new(body: "hi all! excited to be here")
      expect(post).to be_invalid
      expect(post.errors[:body]).to include("Doesn't have a reference to Sunny!")
    end
  end
end
