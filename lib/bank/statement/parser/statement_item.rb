require "date"

module Bank
  module Statement
    module Parser
      class StatementItem # rubocop:disable Style/Documentation
        attr_reader :date, :value, :description

        def initialize(date:, value:, description:)
          @date = format_date(date)
          @value = format_value(value)
          @description = description
        end

        def entrada?
          @value.positive?
        end

        def saida?
          @value.negative?
        end

        private

        def format_date(date)
          return date if date.is_a?(Date)

          Date.strptime(date, "%d/%m/%Y")
        end

        def format_value(value)
          return value if value.is_a?(Float)

          value.gsub(".", "").gsub(",", ".").to_f
        end
      end
    end
  end
end
