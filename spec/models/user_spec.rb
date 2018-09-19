require "rails_helper"

describe User do
  let(:first_name) {"First"}
  let(:last_name) {"Last"}
  let(:user) { user = User.new(
      first_name: first_name,
      last_name: last_name,
      age: 20,
      sex: 1,
      about: " "
  ) }
  describe '#name' do
    context "when both present" do
      let(:first_name) {"First"}
      let(:last_name) {"Last"}
      it "generates a full name based on first and second names" do
        expect(user.name).to eq("First Last")
        end
    end
    context "when only first name is present" do
      let(:first_name) {"First"}
      let(:last_name) {""}
      it "generates a first name only" do
        expect(user.name).to eq("First")
      end
    end
    context "when only last name is present" do
      let(:first_name) {""}
      let(:last_name) {"Last"}
      it "generates a full name based on first and second names" do
        expect(user.name).to eq("Last")
      end
    end
    context "when none is present" do
      let(:first_name) {""}
      let(:last_name) {""}
      it "generates a full name based on first and second names" do
        expect(user.name).to eq("")
      end
    end
  end

  describe "validation" do
    it "when first name is blank" do
      expect(build(:user, first_name: "")).to be_valid
    end
  end
end