require "rails_helper"

describe Address do
  context "when zip" do
    it "is out of range" do
      expect(build(:user, address_attributes: {zip: 111111})).not_to be_valid
    end
    it "is blank" do
      expect(build(:user, address_attributes: {zip: ""})).not_to be_valid
    end
    it "is wrong spelled" do
      expect(build(:user, address_attributes: {zip: "12567rr"})).not_to be_valid
    end
  end
  context "when house number" do
    it "is blank" do
      expect(build(:user, address_attributes: {house_member: ""})).not_to be_valid
    end
    it "is too big" do
      expect(build(:user, address_attributes: {house_member: 5001})).not_to be_valid
    end
    it "is 0" do
      expect(build(:user, address_attributes: {house_member: 0})).not_to be_valid
    end
  end

  context "when city" do
    it "is blank" do
      expect(build(:user, address_attributes: {city: ""})).not_to be_valid
    end
    it "is too big" do
      expect(build(:user, address_attributes: {city: "a"*101})).not_to be_valid
    end
  end

  context "when street" do
    it "is blank" do
      expect(build(:user, address_attributes: {street: ""})).not_to be_valid
    end
    it "is too big" do
      expect(build(:user, address_attributes: {street: "a"*101})).not_to be_valid
    end
  end
end