require 'spec_helper'

describe Simplabs::Excellent::Checks::FlogClassCheck do

  before do
    @excellent = Simplabs::Excellent::Runner.new([:FlogClassCheck => { :threshold => 0 }])
  end

  describe '#evaluate' do

    it 'should calculate the score correctly' do
      code = <<-END
        class User < ActiveRecord::Base
          has_many :projects
        end
      END
      @excellent.check_code(code)
      warnings = @excellent.warnings

      warnings.should_not be_empty
      warnings[0].info.should        == { :class => 'User', :score => 1 }
      warnings[0].line_number.should == 1
      warnings[0].message.should     == "User has flog score of 1."
    end

  end

end
