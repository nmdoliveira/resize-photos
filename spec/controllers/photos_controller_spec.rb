RSpec.describe PhotosController do
  describe "GET index" do
    let(:photo) { build :photo, image_uid: "123" }
    let(:json) do
      {
        "photos" => [
          {
            "small_url" => "http://test.host/photos/123?size=320x240",
            "medium_url" => "http://test.host/photos/123?size=384x288",
            "large_url" => "http://test.host/photos/123?size=640x480"
          }
        ]
      }
    end

    context "when there are photos" do
      before do
        allow(Photo).to receive(:exists?).and_return(true)
      end

      it "responds with all photos" do
        expect(Photo).to receive(:all).and_return([photo])
        get :index, format: :json
        expect(json_response).to eq json
      end
    end

    context "when there aren't photos" do
      before do
        allow(Photo).to receive(:exists?).and_return(false)
      end

      it "invokes PhotoJob and responds with fetched photos" do
        expect(PhotoJob).to receive(:perform_now).and_return([photo])
        get :index, format: :json
        expect(json_response).to eq json
      end
    end
  end
end
