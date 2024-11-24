class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v0.1.0/migraine-darwin-amd64"
      sha256 "1087a0f33a71fe41318eca6aca81c5dbe24ca6ac7f74456b2680783f139da48e"
    else
      url "https://github.com/tesh254/migraine/releases/download/v0.1.0/migraine-darwin-arm64"
      sha256 "686b31331e10e2cff5d2a9414773965862f2124555de62734b92a3a844247b8d"
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
