require 'simplabs/excellent/checks/base'

module Simplabs

  module Excellent

    module Checks

      # This check reports empty +rescue+ blocks. Empty +rescue+ blocks suppress all errors which is usually not a good technique.
      #
      # ==== Applies to
      #
      # * +rescue+ blocks
      class EmptyRescueBodyCheck < Base

        def initialize(options = {}) #:nodoc:
          super
          @interesting_contexts = [Parsing::ResbodyContext]
        end

        def evaluate(context) #:nodoc:
          add_warning(context, 'Rescue block is empty.', {}, -1) unless context.has_statements?
        end

      end

    end

  end

end
