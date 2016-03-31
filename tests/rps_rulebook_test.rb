require_relative "../lib/rps_rulebook.rb"
require_relative "test_helper.rb"

class RpsRulebookTest < MiniTest::Test

  def test_can_be_created_normally
    rulebook = RpsRulebook.new
    refute_nil(rulebook)
  end

  def test_determine_outcome_rock_rock
    rulebook = RpsRulebook.new
    assert_equal(0, rulebook.determine_outcome(0,0))
  end

  def test_determine_outcome_rock_paper
    rulebook = RpsRulebook.new
    assert_equal(2, rulebook.determine_outcome(0,1))
  end

  def test_determine_outcome_rock_scissors
    rulebook = RpsRulebook.new
    assert_equal(1, rulebook.determine_outcome(0,2))
  end

  def test_determine_outcome_paper_rock
    rulebook = RpsRulebook.new
    assert_equal(1, rulebook.determine_outcome(1,0))
  end

  def test_determine_outcome_paper_paper
    rulebook = RpsRulebook.new
    assert_equal(0, rulebook.determine_outcome(1,1))
  end

  def test_determine_outcome_paper_scissors
    rulebook = RpsRulebook.new
    assert_equal(2, rulebook.determine_outcome(1,2))
  end

  def test_determine_outcome_scissors_rock
    rulebook = RpsRulebook.new
    assert_equal(2, rulebook.determine_outcome(2,0))
  end

  def test_determine_outcome_scissors_paper
    rulebook = RpsRulebook.new
    assert_equal(1, rulebook.determine_outcome(2,1))
  end

  def test_determine_outcome_scissors_scissors
    rulebook = RpsRulebook.new
    assert_equal(0, rulebook.determine_outcome(2,2))
  end
end
