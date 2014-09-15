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
        Note.new note
      end
    end
  end
end
