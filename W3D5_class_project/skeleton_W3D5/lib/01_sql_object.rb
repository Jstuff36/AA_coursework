require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    unless @cols
        table = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        "#{self.table_name}"
      SQL
      @cols = table.first.map(&:to_sym)
    end
    @cols
  end

  def self.finalize!
    self.columns.each do |col|
      define_method(col) { attributes[col] }

      define_method("#{col.to_s}=") do |value|
        attributes[col] = value
      end
    end

  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    if @table_name
      @table_name
    else
      self.to_s.tableize
    end

  end

  def self.all
    query = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        "#{self.table_name}"
    SQL

    parse_all(query)
  end

  def self.parse_all(results)
    results.map do |hash|
      self.new(hash)
    end
  end

  def self.find(id)
    query = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        '#{self.table_name}'
      WHERE
        id = ?
    SQL
    query.empty? ? nil : parse_all(query).first
  end

  def initialize(params = {})
    params.each do |my_attr, value|
      raise "unknown attribute '#{my_attr}'" unless self.class.columns.include? my_attr.to_sym
      send("#{my_attr}=", value)
    end
  end

  def attributes
    if @attributes
      @attributes
    else
      @attributes = {}
    end
  end

  def attribute_values
    self.class.columns.map { |col| self.send(col) }
  end

  def insert
    columns = self.class.columns.drop(1)
    col_names = columns.join(", ")
    question_marks = (["?"] * columns.length).join(", ")

    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} #{col_nums}
      VALUES
        #{question_marks}
      SQL

      self.id = DBConnection.last_insert_row_id
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
