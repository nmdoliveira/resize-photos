RSpec.describe PhotoCollection do
  subject { described_class.new(:photos) }

  it { is_expected.to respond_to :photos }
end
