class Migraine < Formula
    desc "migraine is a command-line interface (CLI) tool designed to help you manage migrations in your backend project using a PostgreSQL database."
    homepage "https://github.com/tesh254/migraine"
    url "https://github.com/tesh254/migraine/releases/download/v0.0.2-alpha.1/migraine_0.0.2-alpha.1_darwin_amd64.tar.gz"
    sha256 "f2a513786abed2a4677eb863a3a990c916bafd7f9bb53ca79965f5da5a190438"
    version "v0.0.2-alpha.1"
    version_scheme 1
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/tesh254/migraine/releases/download/v0.0.2-alpha.1/migraine_0.0.2-alpha.1_darwin_arm64.tar.gz"
        sha256 "f641978a2f0250dfef2d30610810c55e343a4c3d4b3534d773c60948337c535a"
      end
    end
  
    def install
        bin.install "migraine"
    end
  
    test do
      system bin/"migraine", "--version"
    end
end
  
