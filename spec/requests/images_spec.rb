require "rails_helper"

describe "Images", :type => :request do
  describe "#index" do
    before do
      get root_path
    end
    it "succeeds" do
      expect(response).to be_ok
    end
    it "renders index" do
      expect(response).to render_template("pictures/index")
    end
  end
end