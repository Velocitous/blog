require 'spec_helper'
require 'blocking_spec_helper'

require 'persistence/post'

describe 'app/persistence/post.rb' do
  before do
    @post = ::Persistence::Post.new title: Faker::Name.name, body: Faker::Lorem.paragraph, author: "Johnneylee"
  end

  describe ::Persistence::Post, 'validates' do
    %w[title body author].each do |attribute|
      it "presence of #{attribute}" do
        setter = attribute + "="
        @post.send setter.to_sym, nil
        @post.should be_invalid
      end
    end

    it 'uniqueness of title' do
      title = Faker::Name.name
      ::Persistence::Post.create! title: title, body: Faker::Lorem.paragraph, author: Faker::Name.name
      @post.title = title

      @post.should be_invalid
    end

  end

  describe ::Persistence::Post, 'methods' do
    describe "#author" do
      it 'should be a string' do
        @post.author.should be_an_instance_of String
      end
    end
  end
end
