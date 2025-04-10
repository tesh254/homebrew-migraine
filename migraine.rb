class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v1.0.0/migraine-darwin-amd64"
      sha256 "8051c0ba77dfc63620241391a0469c17887d9421a90880e255a59be4201487e0"
    else
      url "https://github.com/tesh254/migraine/releases/download/v1.0.0/migraine-darwin-arm64"
      sha256 "971c86f17d55f867edbb5f217ccbe7438e88121893ca4743b28e2d5d15f1ab9a"
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
