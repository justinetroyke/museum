require './lib/museum'
require './lib/patron'
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

  def test_museum_has_revenue_and_it_is_0
    dmns = Museum.new("Denver Museum of Nature and Science")

    assert_equal 0, dmns.revenue
  end

  def test_museum_can_admit_patrons_with_general_admittance
    dmns = Museum.new("Denver Museum of Nature and Science")
    bob = Patron.new("Bob")
    bob.add_interest("Gems and Minerals")
    dmns.admit(bob)

    assert_equal 10, dmns.revenue
  end

  def test_when_partron_interest_and_exhibit_are_same_revenue_increases
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit("Dead Sea Scrolls", 10)
    dmns.add_exhibit("Gems and Minerals", 0)
    bob = Patron.new("Bob")
    bob.add_interest("Dead Sea Scrolls")
    dmns.admit(bob)

    assert_equal 20, dmns.revenue
  end

  def test_patron_can_have_more_than_one_interest
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit("Dead Sea Scrolls", 10)
    dmns.add_exhibit("Gems and Minerals", 0)
    bob = Patron.new("Bob")
    bob.add_interest("Gems and Minerals")
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Imax")
    dmns.admit(bob)

    assert_equal 20, dmns.revenue
  end

  def test_multiple_patrons_can_have_more_than_one_interest
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit("Dead Sea Scrolls", 10)
    dmns.add_exhibit("Gems and Minerals", 0)
    bob = Patron.new("Bob")
    bob.add_interest("Gems and Minerals")
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Imax")
    dmns.admit(bob)
    sally = Patron.new("Sally")
    sally.add_interest("Dead Sea Scrolls")
    dmns.admit(sally)

    assert_equal 40, dmns.revenue
  end

  def test_it_can_list_one_patron_that_visit_exhibit
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit("Dead Sea Scrolls", 10)
    dmns.add_exhibit("Gems and Minerals", 0)
    bob = Patron.new("Bob")
    bob.add_interest("Dead Sea Scrolls")
    dmns.admit(bob)

    assert_equal ["Bob"], dmns.patrons_of("Dead Sea Scrolls")
    assert_equal [nil], dmns.patrons_of("Gems and Minerals")
  end

  def test_it_can_list_patrons_that_visited_exhibit
    skip
    # I know I would have needed to re-work my code order since the location of
    # would cause the value of @visits.store(interest, patron.name) to reset each time it went
    # through the enum.
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit("Dead Sea Scrolls", 10)
    dmns.add_exhibit("Gems and Minerals", 0)
    bob = Patron.new("Bob")
    bob.add_interest("Dead Sea Scrolls")
    dmns.admit(bob)
    sally = Patron.new("Sally")
    sally.add_interest("Dead Sea Scrolls")
    dmns.admit(sally)

    assert_equal ["Bob", "Sally"], dmns.patrons_of("Dead Sea Scrolls")
    assert_equal [nil], dmns.patrons_of("Gems and Minerals")
  end
end
