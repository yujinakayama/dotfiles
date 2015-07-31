begin
  require 'increments/schedule'
  require 'pp'
rescue LoadError
end

begin
  require 'astrolabe/builder'
  require 'parser/current'

  class Source
    attr_reader :buffer, :ast, :path, :error

    def initialize(arg)
      if File.exist?(arg)
        @path = arg
        raw_source = File.read(@path)
      else
        raw_source = arg
      end

      parse(raw_source)
    end

    def to_s
      buffer.source
    end

    private

    def parse(raw_source)
      @buffer = Parser::Source::Buffer.new(@path || '(string)')
      @buffer.source = raw_source

      builder = Astrolabe::Builder.new
      parser = Parser::CurrentRuby.new(builder)

      @ast = parser.parse(@buffer)
    rescue Parser::SyntaxError, EncodingError => error
      @error = error
    end
  end

  class SourceRewriter
    attr_accessor :source, :rewriter

    def self.rewrite(arg, &block)
      new(arg).rewrite(&block)
    end

    def initialize(arg)
      @source = Source.new(arg)
      @rewriter = Parser::Source::Rewriter.new(@source.buffer)
    end

    def rewrite(&block)
      instance_exec(source.ast, &block)

      rewritten_raw_source = rewriter.process

      if source.path
        File.write(source.path, rewritten_raw_source)
        nil
      else
        rewritten_raw_source
      end
    end

    private

    def remove(range)
      return unless range
      rewriter.remove(range)
    end

    def insert_before(range, content)
      return unless range
      rewriter.insert_before(range, content)
    end

    def insert_after(range, content)
      return unless range
      rewriter.insert_after(range, content)
    end

    def replace(range, content)
      return unless range
      rewriter.replace(range, content)
    end
  end
rescue LoadError
end
