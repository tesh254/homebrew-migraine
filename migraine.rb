class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "2.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v2.1.0/migraine-darwin-amd64"
      sha256 "4c7d0dba238f24a2c64af0dd657aa8a52f7941159d4303a681c8f42fd4ca1e4f"
    else
      url "https://github.com/tesh254/migraine/releases/download/v2.1.0/migraine-darwin-arm64"
      sha256 "c84b7d2774c2502af53d0b3c0b061aa86a6a4e232e5ebeea4917f1afc1cae955"
    end
  end

  def install
    bin.install Dir["migraine-*"][0] => "migraine"
    # Create the mgr alias
    bin.install_symlink "migraine" => "mgr"
  end

  test do
    # Test basic version command
    system "#{bin}/migraine", "--version"
    system "#{bin}/mgr", "--version"
    
    # Test BuildInfo version commands
    assert_match version.to_s, shell_output("#{bin}/migraine version --short")
    assert_match "Platform:", shell_output("#{bin}/migraine version")
    
    # Test JSON output is valid
    json_output = shell_output("#{bin}/migraine version --json")
    assert_match "version", json_output
    assert_match "platform", json_output
  end
end
