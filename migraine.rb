class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "1.0.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v1.0.5/migraine-darwin-amd64"
      sha256 "bc7ad7b3a2c2b652d76bb13f1875dd438c8f14715467cbcbfc0da3b9a5e15d95"
    else
      url "https://github.com/tesh254/migraine/releases/download/v1.0.5/migraine-darwin-arm64"
      sha256 "7eab8dedb8bcbaf5aaabbc0819692f9e0b23b245b4e15d956f2b313ee1a484b0"
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
