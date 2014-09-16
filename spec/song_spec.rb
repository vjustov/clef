require 'spec_helper.rb'

describe(Clef::Models::Song) do
  before do
    @song = Clef::Models::Song.new ""
  end
  it("should have a header") do
    @song.should respond_to(:header)
    @song.header.should be_kind_of(Hash)
  end
  it("should have a body")
  describe("Song.header") do
    let(:data) do
      <<-EOT
      X:1
      T:Paddy O'Rafferty
      C:Trad.
      M:6/8
      K:D
      dff cee|def gfe|dff cee|dfe dBA|dff cee|def gfe|faf gfe|1 dfe dBA:|2 dfe dcB|]
      ~A3 B3|gfe fdB|AFA B2c|dfe dcB|~A3 ~B3|efe efg|faf gfe|1 dfe dcB:|2 dfe dBA|]
      fAA eAA|def gfe|fAA eAA|dfe dBA|fAA eAA|def gfe|faf gfe|dfe dBA:|
      EOT
    end

    it "should parse a header" do
      val = Clef::Models::Song.new data
      puts val.header
      val.header["X"].should eq("1")
    end
  end
end

