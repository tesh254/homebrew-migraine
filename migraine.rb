class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "1.0.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v1.0.3/migraine-darwin-amd64"
      sha256 "9b32f98ea873f6bd434674dda5e524a4b9df653c55e2e8824dd9f105cb84cc5d"
    else
      url "https://github.com/tesh254/migraine/releases/download/v1.0.3/migraine-darwin-arm64"
      sha256 "c92edcba10a2ee13157f4b71894a44f244a7505bfb9854957fce79a62f0651cc"
    end
  end

  def install
    bin.install Dir["migraine-*"][0] => "migraine"
    # Create the mgr alias
    bin.install_symlink "migraine" => "mgr"
  end

  test do
    system "#{bin}/migraine", "--version"
    system "#{bin}/mgr", "--version"
  end
end
