require_relative('sql_runner')
require('pg')

class Team

  attr_reader(:id, :name)

  def initialize(options, runner)
    @id = options['id'].to_i
    @name = options['name']
    @runner = runner
  end

  def save()
    sql = "INSERT INTO teams (name) VALUES ('#{@name}') RETURNING *"
    return Team.map_item(sql, @runner)
  end

  def update_name(name)
    @name = name
    sql = "UPDATE teams SET name = '#{@name}' WHERE id = #{@id}"
    @runner.run(sql)
  end

  def self.all(runner)
    sql = "SELECT * FROM teams"
    result = Team.map_items(sql, runner)
    return result
  end

  def self.delete(runner)
    sql = "DELETE FROM teams"
    runner.run(sql)
  end

  def self.map_items(sql, runner)
    teams_data = runner.run(sql)
    result = teams_data.map { |team| Team.new(team, runner) }
    return result
  end

  def self.map_item(sql, runner)
    result = Team.map_items(sql, runner)
    return result.first
  end


end
