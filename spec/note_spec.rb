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
        @note.should respond_to(:pitch)
      end
      it("should have a valid length") do
        @note.should respond_to(:length)
      end

      it("should have an octave") do
        @note.should respond_to(:octave)
      end
    end
  end
  describe(".parse") do
    it("by default, should return a center scale note") do
      Clef::Models::Note.parse('A').octave.should eq(4)
    end
    it("by default, should return a single quater note") do
      Clef::Models::Note.parse('A').length.should eq("1/4")
    end
    it("should return a Note") do
      Clef::Models::Note.parse('A3').should be_kind_of(Clef::Models::Note)
    end
    context("when parsing") do
      it("should rise or lower the octave based on the commas or apostrophes") do
        Clef::Models::Note.parse("A''").octave.should eq(6)
        Clef::Models::Note.parse('A,,').octave.should eq(2)
        Clef::Models::Note.parse("A''''").octave.should eq(8)
      end
      it("should match the note length appropriately")
      it("should understand dotted notes")
    end

    it("should error when input is invalid")
  end
end
