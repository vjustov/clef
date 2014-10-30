module Clef
  module Models
    class Note
      def initialize pitch:, length: 2, octave: 4, parent_song: Song.new
        @pitch = pitch
        @length = length
        @octave = octave
        @parent_song = parent_song
      end

      def pitch
        @pitch
      end

      def length
        @length.to_r * @parent_song.default_length
      end

      def octave
        @octave
      end

      def parent_song
        @parent_song
      end

      def self.parse note
        pitch = note[0].upcase
        octave = note[0].lowercase? ? 5 : 4
        offsets = /[A-Ga-g]([',]+)/.match(note)
        if offsets
          offsets = offsets.captures[0]
          octave_offset = offsets[0].eql?(',') ? -offsets.length : offsets.length
          octave = octave + octave_offset
        end
        Note.new pitch, nil, octave
      end
    end
    class Song
      attr_accessor :header, :body

      def initialize(string="")
        @header = {}
        parse_header string
        parse_body string
      end

      def default_length
      end

      private
      def parse_header string
        fields = string.scan /^[A-Z]:.*$/
        fields.each do |line|
         key, value = line.strip.split(':')
          @header[key] = value
        end
      end

      def parse_body string
        match = /^K:.$.(.*)/m.match(string)
        @body = match ? match.captures[0] : ""
      end
    end
  end
end

class String
  def lowercase?
    self.downcase == self
  end

  def uppercase?
    self.upcase == self
  end
end
