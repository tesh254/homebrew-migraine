class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "0.0.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v0.0.4/migraine-darwin-amd64"
      sha256 "21b6a2a49da914f281d25b0f7c2bffc76df8f5f3a3224a6175ba1e2bf496851d"
    else
      url "https://github.com/tesh254/migraine/releases/download/v0.0.4/migraine-darwin-arm64"
      sha256 "831cf03b8b8632a6cd68f36af560050a8981a819b864b98fddf7a3500f882b3a"
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
