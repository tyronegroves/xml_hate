require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe XmlHate::Node do
  describe "creating a node with a simple node" do
    before do
      @object = XmlHate::Node.new({:firstname => "John", :lastname => "Carter" })
    end

    it "should respond to first name" do
      @object.respond_to?(:firstname).must_equal true 
    end

    it "should respond to last name" do
      @object.respond_to?(:lastname).must_equal true 
    end

    it "should not respond to other things" do
      @object.respond_to?(:something).must_equal false 
      @object.respond_to?(:else).must_equal false 
    end

    it "should return the first name" do
      @object.firstname.must_equal "John" 
    end
  
    it "should return the last name" do
      @object.lastname.must_equal "Carter" 
    end

    it "should return an empty string for a singular name" do
      @object.cat.must_equal "" 
      @object.dog.must_equal ""
    end

    it "should return an empty array for plural names" do
      @object.cats.must_equal []
      @object.dogs.must_equal []
    end

  end
end
