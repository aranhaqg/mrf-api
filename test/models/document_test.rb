require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
   test "don't create a document withou a body" do
    document = Document.new 
    assert_not document.save
   end
end
