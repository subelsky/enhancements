require 'test/unit'
require File.join(File.dirname(__FILE__),'..','lib','subelsky_enhancements','hash')

class TestHash < Test::Unit::TestCase
  
  def hash
    @hash ||= { :a => 1, :b => 2, :c => 3, :d => 4 }
  end
  
  def test_except_with_one_key
    assert_equal({ :a => 1, :b => 2, :d => 4 }, hash.except(:c))
  end

  def test_except_with_multiple_keys
    assert_equal({ :b => 2, :c => 3 }, hash.except(:a,:d))
  end

  def test_except_with_absent_key
    assert_equal(hash, hash.except(:e))
  end

  def test_only_with_one_key
    assert_equal({ :a => 1 }, hash.only(:a))
  end

  def test_only_with_multiple_keys
    assert_equal({ :b => 2, :c => 3, :d => 4 }, hash.only(:b,:c,:d))
  end

  def test_only_with_absent_key
    assert_equal({}, hash.only(:e))
  end

end