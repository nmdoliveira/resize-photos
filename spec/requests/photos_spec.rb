RSpec.describe "Photos endpoint" do
  describe "GET /photos" do
    before do
      create :photo, image_uid: "123"
    end

    it "responds with json with urls for photo sizes" do
      get "/photos"
      expect(json_response).to eq "photos" => [
        {
          "small_url" => "http://test.host/photos/123?size=320x240",
          "medium_url" => "http://test.host/photos/123?size=384x288",
          "large_url" => "http://test.host/photos/123?size=640x480"
        }
      ]
    end
  end

  describe "GET /photo/:uid" do
    let(:photo) { create :photo }
    let(:image) { File.open(Rails.root.join("spec/support/files/image.jpg")) }
    let(:thumb) { File.open(Rails.root.join("spec/support/files/thumb.jpg")) }

    before do
      photo.image = image
      photo.save
    end

    context "with size" do
      it "responds with thumb" do
        get "/photos/#{photo.image_uid}?size=20x20"
        expect(response.headers["Content-Type"]).to eq "image/jpeg"
        expect(response.body.force_encoding("utf-8")).to eq thumb.read
      end
    end

    context "without size" do
      it "responds with image" do
        get "/photos/#{photo.image_uid}"
        expect(response.headers["Content-Type"]).to eq "image/jpeg"
        expect(response.body.force_encoding("utf-8")).to eq image.read
      end
    end
  end
end
