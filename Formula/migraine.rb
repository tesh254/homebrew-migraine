class Migraine < Formula
    desc "migraine is a command-line interface (CLI) tool designed to help you manage migrations in your backend project using a PostgreSQL database."
    homepage "https://github.com/tesh254/migraine"
    url "https://github.com/tesh254/migraine/releases/download/v0.0.2-alpha.4/migraine_0.0.2-alpha.4_darwin_amd64.tar.gz"
    sha256 "0ec8e25323a6499c2d85d1f551c3f53d19e0da722eec5f45f8a8d3049e0ae901"
    version "v0.0.2-alpha.4"
    version_scheme 1
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/tesh254/migraine/releases/download/v0.0.2-alpha.4/migraine_0.0.2-alpha.4_darwin_arm64.tar.gz"
        sha256 "1dde3a8f6fd68842d7f54c5a60c50eb09889e348524a0c07aa4aa433f92cc8bf"
      end
    end
  
    def install
        bin.install "migraine"
    end
  
    test do
      system bin/"migraine", "--version"
    end
end
  
