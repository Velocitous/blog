require 'spec_helper'

require 'models/article'

describe 'app/models/article.rb' do
  before do
    @article = ::Article.new
  end

  describe Article, 'articles' do
    it 'should be awesome' do
      true.should be_true
    end
  end
end
