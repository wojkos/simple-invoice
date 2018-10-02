# frozen_string_literal: true

module Command
  module Result
    class Success
      attr_reader :data
      def initialize(data)
        @data = data
      end

      def success?
        true
      end
    end
  end
end
