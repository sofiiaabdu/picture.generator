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
    context "when first name" do
      it "is blank" do
        expect(build(:user, first_name: "")).not_to be_valid
      end

      it "is out of range" do
        expect(build(:user, first_name: 'a'*101)).not_to be_valid
      end
    end

    context "when last name" do
      it "is blank" do
        expect(build(:user, last_name: "")).not_to be_valid
      end

      it "is out of range" do
        expect(build(:user, last_name: 'a'*101)).not_to be_valid
      end
    end

    context "when about field" do
      it "is out of range" do
        expect(build(:user, about: 'a'*301)).not_to be_valid
      end

      it "is blank" do
        expect(build(:user, about: "")).to be_valid
      end
    end

    context "when age" do
      it "is blank" do
        expect(build(:user, age: "")).to be_valid
      end

      it "is greater then 120" do
        expect(build(:user, age: 121)).not_to be_valid
      end
    end

    context "when sex" do
      it "is not in range" do
        expect(build(:user, sex: 2)).to be_valid
      end
    end
  end
end