# frozen_string_literal: true

require_relative "parser/version"
require_relative "parser/statement_item"
require_relative "nubank/credit_card/parser"

module Bank
  module Statement
    module Parser
      class Error < StandardError; end
      # Your code goes here...
    end
  end
end
