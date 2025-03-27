class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "0.1.7"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v0.1.7/migraine-darwin-amd64"
      sha256 "9068cdf5e85a04d2a6396151509a16a7c71d0f13e10f70b65d0e7917244270c7"
    else
      url "https://github.com/tesh254/migraine/releases/download/v0.1.7/migraine-darwin-arm64"
      sha256 "ba43f3f0d813f4fbea3093512a9dbe67d2d723873492b383743004959a0d293d"
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
