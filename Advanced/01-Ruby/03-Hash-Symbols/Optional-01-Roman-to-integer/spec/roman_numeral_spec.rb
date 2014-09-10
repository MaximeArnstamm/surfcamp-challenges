# Encoding: utf-8

require "spec_helper"
require "roman_to_integer"

describe "#roman_to_integer" do

  it "should compute simple digit" do
    roman_to_integer("I").must_equal 1
    roman_to_integer("V").must_equal 5
  end

  it "should compute simple number" do
    roman_to_integer("II").must_equal 2
    roman_to_integer("XV").must_equal 15
  end

  it "should compute complex numbers" do
    roman_to_integer("IV").must_equal 4
    roman_to_integer("MMCM").must_equal 2900
  end

end