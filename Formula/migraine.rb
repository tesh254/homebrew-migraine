class Migraine < Formula
    desc "migraine is a command-line interface (CLI) tool designed to help you manage migrations in your backend project using a PostgreSQL database."
    homepage "https://github.com/tesh254/migraine"
    url "https://github.com/tesh254/migraine/releases/download/v0.0.2-alpha.3/migraine_0.0.2-alpha.3_darwin_amd64.tar.gz"
    sha256 "63e290028fab4fff8f9b3e379a96fa6a2e89831002c64c28729bf486ea00c4b5"
    version "v0.0.2-alpha.3"
    version_scheme 1
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/tesh254/migraine/releases/download/v0.0.2-alpha.3/migraine_0.0.2-alpha.3_darwin_arm64.tar.gz"
        sha256 "9ba85f6b71c1a841ab656bcb7218c9960e7a38cc9277d1dd5ed608be0c454072"
      end
    end
  
    def install
        bin.install "migraine"
    end
  
    test do
      system bin/"migraine", "--version"
    end
end
  
