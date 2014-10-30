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

      def initialize string
        @header = {}
        fields = string.scan /^[A-Z]:.*$/
        fields.each do |l|
          l.strip!
          pair = l.split(':')
          key = pair[0]
          value = pair[1]
          @header[key] = value
        end
        body = /^K:.$.(.*)/m.match(string)
        @body = body ? body.captures[0] : ""
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
