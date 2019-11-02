require "rails_helper"

describe "Favourites", :type => :request do
  let(:password) {"123456"}
  let!(:bob) {create(:user)}
  let!(:picture) { create(:picture, user_id: bob.id) }
  let(:favourite) {create(:favourite, user_id: bob.id, picture_id: picture.id)}

  before do
    post "/users/sign_in", params: {user: {email: bob.email, password: password}}
  end

   describe "#index" do
     before do
       get favourites_path
     end

     it "succeeds" do
       expect(response).to be_ok
     end
   end

  describe "#create" do
    let(:post_request) do
      post(favourites_path, params: {picture_id: picture.id})
    end

    it "succeeds" do
     expect { post_request }.to change{ Favourite.where(user_id: bob.id, picture_id: picture.id).count }.from(0).to(1)
    end
  end

  describe "#destroy" do
    let(:delete_request) do
      delete "/favourites/#{favourite.id}"
    end

    it "succeeds" do
      expect{ delete_request }.to change{ Favourite.where(id: favourite.id).count }.from(1).to(0)
    end
  end
end