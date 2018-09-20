require "rails_helper"

describe "Favourites", :type => :request do
  let(:password) {"123456"}
  let!(:bob) {create(:user)}
  let!(:picture) { create(:picture, user_id: bob.id) }

  before do
    post "/users/sign_in", params: {user: {email: bob.email, password: password}}
  end

   describe "#index" do
     before do
       post "/users/sign_in", params:{bob: {email: "ad@admin.com", password: "123456"}}
       get favourites_path
     end

     it "succeeds" do
       expect(response.status).to eq(200)
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
end