require 'spec_helper.rb'

describe(Clef::Models::Note) do
  describe("when creating a note") do
    context("with valid parameters") do
      before :all do
        @note = Clef::Models::Note.new "C"
      end

      it("should create a Note object") do
        @note.should be_a_kind_of(Clef::Models::Note)
      end

      it("should have a valid note") do
        @note.pitch.should eq("C")
      end
      it("should have a valid length") do
        @note.length.should eq("1/4")
      end

      it("should have an octave") do
        @note.octave.should eq(8)
      end
    end
  end
  describe(".parse") do
    it("by default, should return a center scale note")
    it("by default, should return a single quater note")
    it("should return a Note") do
      Clef::Models::Note.parse('A3').should be_kind_of(Clef::Models::Note)
    end
    context("when parsing") do
      it("should rise or lower the octave based on the commas or apostrophes")
      it("should match the note length appropriately")
      it("should understand dotted notes")
    end

    it("should parse valid ABC") do

      Clef::Models::Note.parse('A3').should be_kind_of(Clef::Models::Note)
      Clef::Models::Note.parse('A/2').should be_kind_of(Clef::Models::Note)
      Clef::Models::Note.parse('a3').should be_kind_of(Clef::Models::Note)
    end

    it("should error when input is invalid")
  end
end
