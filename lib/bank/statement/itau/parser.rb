# frozen_string_literal: true

require "csv"

module Itau
  class Parser # rubocop:disable Style/Documentation
    def initialize(file)
      @file = file
    end

    def build
      CSV.foreach(@file, col_sep: ";").map(&method(:row_to_object))
    end

    private

    def row_to_object(row)
      Bank::Statement::Parser::StatementItem.new(
        date: Date.strptime(row[0], "%d/%m/%Y"),
        description: row[1],
        value: row[2].gsub(",", ".").to_f
      )
    rescue Date::Error
      nil
    end
  end
end
