require('minitest/autorun')
require_relative('../models/league')
require_relative('../models/sql_runner')
require_relative('../models/team')
require_relative('../models/match')
require_relative('../models/player')

class TestLeague < Minitest::Test

  def setup

    runner = SqlRunner.new({dbname: "dodgeball_league", host: "localhost"})

    Match.delete(runner)
    Player.delete(runner)
    Team.delete(runner)

    team1 = Team.new({"name" => "Globo Gym"}, runner)
    @t1 = team1.save()
    team2 = Team.new({"name" => "Average Joes"}, runner)
    @t2 = team2.save()

    match1 = Match.new({"home_team_id" => @t1.id, "away_team_id" => @t2.id, "home_team_score" => 2, "away_team_score" => 3}, runner)
    @m1 = match1.save()
    match2 = Match.new({"home_team_id" => @t2.id, "away_team_id" => @t1.id, "home_team_score" => 2, "away_team_score" => 0}, runner)
    @m2 = match2.save()

    @league = League.new(runner)

  end

  def test_match_winner_by_id
    assert_equal("72", @league.match_winner_by_id(@m1))
  end




end