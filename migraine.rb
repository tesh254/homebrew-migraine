class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "0.0.11"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v0.0.11/migraine-darwin-amd64"
      sha256 "6b337d4d06372b4051623ffc8c9f010c0396738e6855940be959587652b5b0fa"
    else
      url "https://github.com/tesh254/migraine/releases/download/v0.0.11/migraine-darwin-arm64"
      sha256 "8f88b2d71268c2b2c417efb74f62c3d6877c63cb2b3c196921e6470b978bc92f"
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
