require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the AdminHelper. For example:
#
# describe AdminHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe AdminHelper, type: :helper do
  describe AdminHelper do
    describe "format floats" do
      it "rounds floats to two place" do
        expect(helper.format_floats(3.356)).to eq(3.36)
      end
    end
  end
end
