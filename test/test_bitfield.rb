# encoding: utf-8
require "test/unit"

require 'whatlanguage/bitfield'

class TestBitfield < Test::Unit::TestCase
  def setup
    @bitfield = BitField.new(10)
  end

  def test_set_byte
    assert_equal 0, @bitfield[3]
    @bitfield[3] = 1
    assert_equal 1, @bitfield[3]
  end

  def test_string_representation
    set_3_bits!
    assert_equal "0001100100", @bitfield.to_s
  end

  def test_total_set
    set_3_bits!
    assert_equal 3, @bitfield.total_set
  end

  def set_3_bits!
    @bitfield[3] = 1
    @bitfield[4] = 1
    @bitfield[7] = 1
  end

end
