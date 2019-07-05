require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  test "valid uri" do
    link = Link.new(uri: 'http://example.com', hashid: '123123')
    assert link.valid?
  end

  test "invalid uri" do
    link = Link.new(uri: 123, hashid: '123123')
    refute link.valid?
  end

  test "unique uri & hashid" do
    link = links(:one)
    dup = link.dup
    refute dup.valid?
    assert dup.errors.include?(:uri)
    assert dup.errors.include?(:hashid)
  end
end
