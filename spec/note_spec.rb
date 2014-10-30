require 'spec_helper.rb'

describe(Clef::Models::Note) do
  let(:note) { Clef::Models::Note.new pitch: "C", length: "2" }
  let(:song_note) { Clef::Models::Note.new pitch: "C", length: 2, parent_song: stubbed_song }
  it "has a pitch" do
    expect(note.pitch).to eq("C")
  end
  it "has a parent song" do
    expect(note).to respond_to(:parent_song)
    expect(note.parent_song).to be_kind_of(Clef::Models::Song)
  end
  it "has a length" do
    song = instance_double("Clef::Models::Song")
    allow(song).to receive(:default_length) { "1/8".to_r }

    other_note = Clef::Models::Note.new pitch: "C", length: 2, parent_song: song
    expect(other_note).to respond_to(:length)
    expect(other_note.length).to eq("1/4".to_r)
  end
end
