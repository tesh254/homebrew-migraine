class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "2.0.9"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v2.0.9/migraine-darwin-amd64"
      sha256 "4c17bf4c9494b0a8c1c271ffbf7597731b63b39ab90cb06785ae05fda1e3618a"
    else
      url "https://github.com/tesh254/migraine/releases/download/v2.0.9/migraine-darwin-arm64"
      sha256 "03fbffaab9be00a491675d5de468414102658365ea2929b7d4cbb0074496e5c6"
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
