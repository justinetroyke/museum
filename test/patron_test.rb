require './lib/patron'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'


class PatronTest < Minitest::Test

  def test_class_exists_and_patron_has_name
    bob = Patron.new("Bob")

    assert_instance_of Patron, bob
    assert_equal "Bob", bob.name
  end

  def test_person_starts_with_no_interests
    bob = Patron.new("Bob")

    assert_equal [], bob.interests
  end

  def test_you_can_add_intersts
    bob = Patron.new("Bob")
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Gems and Minerals")

    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], bob.interests
  end

  def test_
end
