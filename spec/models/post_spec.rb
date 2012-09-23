require 'spec_helper'

require 'models/post'

describe 'app/models/post.rb' do
  before do
    @post = ::Post.new
  end
  
  describe Post, 'articles' do
    it 'should be awesome' do
      true.should be_true
    end
  end
end