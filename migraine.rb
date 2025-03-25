class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v0.1.5/migraine-darwin-amd64"
      sha256 "051826c65fe89afc26388fd411a90f8b37e8005632570045a526a19f91686f20"
    else
      url "https://github.com/tesh254/migraine/releases/download/v0.1.5/migraine-darwin-arm64"
      sha256 "b5ac1f31c4443fc265cc9657c8c8f46c545e126ddf47bef033e2ee5bc9e0880d"
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
