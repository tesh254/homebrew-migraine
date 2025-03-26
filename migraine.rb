class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "0.1.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v0.1.6/migraine-darwin-amd64"
      sha256 "d8a0c19792d03707ac6183e1f2f461bf5e9a14e4b6b622e834943af8cbb01768"
    else
      url "https://github.com/tesh254/migraine/releases/download/v0.1.6/migraine-darwin-arm64"
      sha256 "441a92b2729867097643db5375205bbca707385baa6bcd9d64ad12dae02c0207"
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
