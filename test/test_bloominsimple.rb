# encoding: utf-8
require "test/unit"

require 'whatlanguage/bloominsimple'

class TestBloominSimple < Test::Unit::TestCase
  def setup
    @bloomfilter = BloominSimple.new(100)
  end

  def test_add
    assert !@bloomfilter.includes?("percy"), "percy should not be indexed yet"

    @bloomfilter.add("percy")
    assert @bloomfilter.includes?("percy"), "percy should be indexed"
  end

  def test_includes
    @bloomfilter.add("percy")
    @bloomfilter.add("peppy")
    @bloomfilter.add("jeppy")

    assert @bloomfilter.includes?("percy"), "percy should be indexed"
    assert !@bloomfilter.includes?("gercy"), "gercy should not be indexed"
  end
end
