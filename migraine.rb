class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "0.0.9"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v0.0.9/migraine-darwin-amd64"
      sha256 "484ce870243855ec8a75932d04030f9efa8dd56ed0a684ceafab8145d65fc5a4"
    else
      url "https://github.com/tesh254/migraine/releases/download/v0.0.9/migraine-darwin-arm64"
      sha256 "f0d30a557e6a898fdb8645a8322ef31672c562acc143a3af064deae78da777a4"
    end
  end

  def install
    bin.install Dir["migraine-*"][0] => "migraine"
    # Create the mig alias
    bin.install_symlink "migraine" => "mig"
  end

  test do
    system "#{bin}/migraine", "--version"
    system "#{bin}/mig", "--version"
  end
end
