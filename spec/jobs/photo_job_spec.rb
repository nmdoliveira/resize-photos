RSpec.describe PhotoJob do
  describe "#perform" do
    let(:url) { "http://example.com/images" }
    let(:image_url) { "http://example.com/image.png" }
    let(:other_image_url) { "http://example.com/other_image.png" }

    let(:data) do
      {
        "images" => [
          { "url" => image_url },
          { "url" => other_image_url }
        ]
      }.to_json
    end

    before do
      stub_env "PHOTOS_URL", url
      stub_request(:get, url).to_return(body: data)
    end

    it "creates photos" do
      expect(Photo).to receive(:create).with(image_url: image_url)
      expect(Photo).to receive(:create).with(image_url: other_image_url)

      subject.perform
    end
  end
end
