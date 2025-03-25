class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v0.1.1/migraine-darwin-amd64"
      sha256 "73be442ccbb13bc0c21a24d34d839608d212c7e58265b2d417c66c66cdabee96"
    else
      url "https://github.com/tesh254/migraine/releases/download/v0.1.1/migraine-darwin-arm64"
      sha256 "a77aa33b25af7cbbc568e5cfef860e0ce056c3ca6f52d38ae70d00056f20f9c1"
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
