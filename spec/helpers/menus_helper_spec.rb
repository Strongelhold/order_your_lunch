require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the MenusHelper. For example:
#
# describe MenusHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe MenusHelper, type: :helper do
  let(:menu) { create :menu }

  describe '#decorate' do
    it 'return decorated date with name of day' do
      decorated = "#{menu.date.strftime('%A')} (#{menu.date.strftime('%d.%m.%Y')})"
      expect(decorate(menu)).to eq "<a href=\"/menus/#{menu.id}/meals\">#{decorated}</a>"
    end
  end
end
