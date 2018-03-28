require './lib/museum'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class MuseumTest < Minitest::Test

  def test_class_exists_and_has_name
    dmns = Museum.new("Denver Museum of Nature and Science")

    assert_instance_of Museum, dmns
    assert_equal "Denver Museum of Nature and Science", dmns.name
  end

  def test_it_can_have_exhibits
    dmns = Museum.new("Denver Museum of Nature and Science")

    assert_instance_of Hash, dmns.exhibits
    assert_equal ({}), dmns.exhibits
  end

  def test_you_add_exhibits
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit("Dead Sea Scrolls", 10)
    dmns.add_exhibit("Gems and Minerals", 0)

    assert_equal ({"Dead Sea Scrolls" => 10, "Gems and Minerals" => 0}), dmns.exhibits
    assert_equal ["Dead Sea Scrolls","Gems and Minerals"], dmns.exhibits.keys
    assert_equal [10,0], dmns.exhibits.values
  end
end
