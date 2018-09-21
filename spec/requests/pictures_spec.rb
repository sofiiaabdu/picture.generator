require "rails_helper"

describe "Pictures", :type => :request do
  let(:password) {"123456"}
  let!(:bob) {create(:user)}
  let!(:alice) {create(:user)}
  let!(:bob_pictures) { FactoryBot.create_list(:picture, 27, user_id: bob.id) }
  let!(:alice_picture) {FactoryBot.create(:picture, user_id: alice.id)}
  let!(:all_pics) {Picture.all}

  describe "#index" do
    before do
      get root_path
    end

    describe "for logged in user" do
      before do
        post "/users/sign_in", params: {user: {email: bob.email, password: password}}
        get root_path
      end

      it "renders all user's pictures" do
        bob_pictures.each {|p| expect(response.body).to have_tag("img.card-img-top", with: {src: p.url}) }
        end
    end

    it "renders all pictures" do
      all_pics.each {|p| expect(response.body).to have_tag("img.card-img-top", with: {src: p.url}) }
    end

    it "succeeds" do
      expect(response).to be_ok
    end

    it "renders index" do
      expect(response).to render_template("pictures/index")
    end
  end

  describe "#destroy" do
    before do
      post "/users/sign_in", params: {user: {email: alice.email, password: password}}
      get root_path
    end

    let(:delete_request) do
      delete "/pictures/#{alice_picture.id}"
    end

    it "succeeds" do
      expect{ delete_request }.to change{ Picture.where(id: alice_picture.id).count }.from(1).to(0)
    end
  end
end