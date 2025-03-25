class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v0.1.3/migraine-darwin-amd64"
      sha256 "c335091c3ee3ec8eaa610dd9b99ea865fb9a120dae5d80c2d192f124c8771dd3"
    else
      url "https://github.com/tesh254/migraine/releases/download/v0.1.3/migraine-darwin-arm64"
      sha256 "328f97537b2fb9d2b8d7d40c23c1b362d371cce94d30cca663d0d9bc80fc8b0e"
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
