module Clef
  module Models
    class Note
      def initialize note, length = nil, octave = nil
        @pitch = note
        @length = length ? length : '1/4'
        @octave = octave ? octave : 4
      end

      def pitch
        @pitch
      end

      def length
        @length
      end

      def octave
        @octave
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
