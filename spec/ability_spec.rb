require 'spec_helper'

require "cancan/matchers"
describe "User" do
  describe "abilities" do
    subject { ability }
    let(:ability){ Ability.new(user) }
    let(:user){ nil }

    context "when is a control officer" do
      let(:user){ create(:control_officer) }

      it{ should_not be_able_to(:create_user, user) }
    end

    context "when is a captain" do
      let(:user){ create(:dispatcher) }

      it{ should be_able_to(:create_user, user) }
    end

    context "when is an admin" do
      let(:user){ create(:admin) }

      it{ should be_able_to(:create_user, user) }
    end
  end
end

