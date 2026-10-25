module RailsVite
  class Error < StandardError; end

  class MissingManifestError < Error
    def initialize(path)
      message = if Rails.env.local?
        "Vite manifest not found at #{path}. Start the Vite dev server with `bin/dev` or precompile assets with `rake vite:build`."
      else
        "Vite manifest not found at #{path}. Run `rake vite:build` to compile assets."
      end
      super(message)
    end
  end

  class BuildError < Error
    def initialize
      super("Vite auto build failed; its errors are in the output above. It retries once a source changes, or run `rake vite:build`.")
    end
  end

  class MissingEntryError < Error
    def initialize(name, path)
      super("Entry \"#{name}\" not found in Vite manifest at #{path}.")
    end
  end
end
