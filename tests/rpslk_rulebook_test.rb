require_relative "../lib/rpslk_rulebook.rb"
require_relative "test_helper.rb"

class RpslkRulebookTest < MiniTest::Test

  def test_can_be_created_normally
    rulebook = RpslkRulebook.new
    refute_nil(rulebook)
  end

  def test_determine_outcome_rock_rock
    rulebook = RpslkRulebook.new
    assert_equal(0, rulebook.determine_outcome(0,0))
  end

  def test_determine_outcome_rock_paper
    rulebook = RpslkRulebook.new
    assert_equal(2, rulebook.determine_outcome(0,1))
  end

  def test_determine_outcome_rock_scissors
    rulebook = RpslkRulebook.new
    assert_equal(1, rulebook.determine_outcome(0,2))
  end

  def test_determine_outcome_rock_spock
    rulebook = RpslkRulebook.new
    assert_equal(2, rulebook.determine_outcome(0,3))
  end

  def test_determine_outcome_rock_lizard
    rulebook = RpslkRulebook.new
    assert_equal(1, rulebook.determine_outcome(0,4))
  end

  def test_determine_outcome_paper_rock
    rulebook = RpslkRulebook.new
    assert_equal(1, rulebook.determine_outcome(1,0))
  end

  def test_determine_outcome_paper_paper
    rulebook = RpslkRulebook.new
    assert_equal(0, rulebook.determine_outcome(1,1))
  end

  def test_determine_outcome_paper_scissors
    rulebook = RpslkRulebook.new
    assert_equal(2, rulebook.determine_outcome(1,2))
  end

  def test_determine_outcome_paper_spock
    rulebook = RpslkRulebook.new
    assert_equal(1, rulebook.determine_outcome(1,3))
  end

  def test_determine_outcome_paper_lizard
    rulebook = RpslkRulebook.new
    assert_equal(2, rulebook.determine_outcome(1,4))
  end

  def test_determine_outcome_scissors_rock
    rulebook = RpslkRulebook.new
    assert_equal(2, rulebook.determine_outcome(2,0))
  end

  def test_determine_outcome_scissors_paper
    rulebook = RpslkRulebook.new
    assert_equal(1, rulebook.determine_outcome(2,1))
  end

  def test_determine_outcome_scissors_scissors
    rulebook = RpslkRulebook.new
    assert_equal(0, rulebook.determine_outcome(2,2))
  end

  def test_determine_outcome_scissors_spock
    rulebook = RpslkRulebook.new
    assert_equal(2, rulebook.determine_outcome(2,3))
  end

  def test_determine_outcome_scissors_lizard
    rulebook = RpslkRulebook.new
    assert_equal(1, rulebook.determine_outcome(2,4))
  end

  def test_determine_outcome_spock_rock
    rulebook = RpslkRulebook.new
    assert_equal(1, rulebook.determine_outcome(3,0))
  end

  def test_determine_outcome_spock_paper
    rulebook = RpslkRulebook.new
    assert_equal(2, rulebook.determine_outcome(3,1))
  end

  def test_determine_outcome_spock_scissors
    rulebook = RpslkRulebook.new
    assert_equal(1, rulebook.determine_outcome(3,2))
  end

  def test_determine_outcome_spock_spock
    rulebook = RpslkRulebook.new
    assert_equal(0, rulebook.determine_outcome(3,3))
  end

  def test_determine_outcome_spock_lizard
    rulebook = RpslkRulebook.new
    assert_equal(2, rulebook.determine_outcome(3,4))
  end

  def test_determine_outcome_lizard_rock
    rulebook = RpslkRulebook.new
    assert_equal(2, rulebook.determine_outcome(4,0))
  end

  def test_determine_outcome_lizard_paper
    rulebook = RpslkRulebook.new
    assert_equal(1, rulebook.determine_outcome(4,1))
  end

  def test_determine_outcome_lizard_scissors
    rulebook = RpslkRulebook.new
    assert_equal(2, rulebook.determine_outcome(4,2))
  end

  def test_determine_outcome_lizard_spock
    rulebook = RpslkRulebook.new
    assert_equal(1, rulebook.determine_outcome(4,3))
  end

  def test_determine_outcome_lizard_lizard
    rulebook = RpslkRulebook.new
    assert_equal(0, rulebook.determine_outcome(4,4))
  end
end
