require "csv"

module Nubank
  module CreditCard
    class Parser # rubocop:disable Style/Documentation
      def initialize(file)
        @file = file
      end

      def build
        CSV.foreach(@file, headers: true).map(&method(:row_to_object)).compact
      end

      private

      def row_to_object(row)
        Bank::Statement::Parser::StatementItem.new(
          date: Date.strptime(row[0], "%Y-%m-%d"),
          description: row[1],
          value: row[2].to_f
        )
      rescue Date::Error
        nil
      end
    end
  end
end
