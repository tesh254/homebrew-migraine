class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "0.0.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v0.0.6/migraine-darwin-amd64"
      sha256 "119625ac91c6122e02c8f751b1e6a387ed9a41230d71a71237ea956291aad03e"
    else
      url "https://github.com/tesh254/migraine/releases/download/v0.0.6/migraine-darwin-arm64"
      sha256 "0c0c7fad8d50812b99830858928eb2a2a58e99a619343204f93bf7aa5da4abe5"
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
