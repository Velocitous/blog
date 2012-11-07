require 'spec_helper'
require 'blocking_spec_helper'

require 'persistence/article'

describe 'app/persistence/article.rb' do
  before do
    @article = ::Persistence::Article.new title: Faker::Name.name, body: Faker::Lorem.paragraph, author: "Johnneylee"
  end

  describe ::Persistence::Article, 'validates' do
    %w[title body author].each do |attribute|
      it "presence of #{attribute}" do
        setter = attribute + "="
        @article.send setter.to_sym, nil
        @article.should be_invalid
      end
    end

    it 'uniqueness of title' do
      title = Faker::Name.name
      ::Persistence::Article.create! title: title, body: Faker::Lorem.paragraph, author: Faker::Name.name
      @article.title = title

      @article.should be_invalid
    end

  end

  describe ::Persistence::Article, 'methods' do
    describe "#author" do
      it 'should be a string' do
        @article.author.should be_an_instance_of String
      end
    end
  end
end
