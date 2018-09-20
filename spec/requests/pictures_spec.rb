require "rails_helper"

describe "Pictures", :type => :request do
  let(:password) {"123456"}
  let!(:bob) {create(:user)}
  let!(:picture) { create(:picture, user_id: bob.id) }

  before do
    post "/users/sign_in", params: {user: {email: bob.email, password: password}}
  end

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

  describe "#destroy" do
    let(:delete_request) do
      delete "/pictures/#{picture.id}"
    end

    it "succeeds" do
      expect{ delete_request }.to change{ Picture.where(id: picture.id).count }.from(1).to(0)
    end
  end
end