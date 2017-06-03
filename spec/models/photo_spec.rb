RSpec.describe Photo do
  it { is_expected.to respond_to :image_uid }
  it { is_expected.to respond_to :image_uid= }

  describe "#image_url=" do
    let(:url) { "http://mocked.com/image.png" }

    before do
      stub_request(:get, url).to_return(body: "abc")
    end

    it "assigns image from url" do
      subject.image_url = url
      subject.save
      expect(subject.image_uid).not_to be_nil
      expect(subject.image.data).to eq "abc"
    end
  end
end
