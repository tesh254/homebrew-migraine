class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v0.1.2/migraine-darwin-amd64"
      sha256 "a186cd0d6d6346e7c72f82b69ada56e877d5075957edd5bd51283d4f4ff7ad3b"
    else
      url "https://github.com/tesh254/migraine/releases/download/v0.1.2/migraine-darwin-arm64"
      sha256 "d84d2c4428e047fd530e218727d292db1805f2a6a11e5f0faa01143d5ad26c0d"
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
