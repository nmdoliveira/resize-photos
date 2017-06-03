RSpec.describe PhotoRepresenter, type: :representer do
  let(:photo) { create :photo, image_uid: "123" }
  let(:json) { read_json :photo }

  it "renders photo as JSON" do
    expect(photo.extend(PhotoRepresenter).to_json).to eq json
  end
end
