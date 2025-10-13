class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "2.0.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v2.0.1/migraine-darwin-amd64"
      sha256 "4550e5c80f7acc0be35dd5441c95bde217fbd6bbbb0ffcc1d4470d1c1b431a72"
    else
      url "https://github.com/tesh254/migraine/releases/download/v2.0.1/migraine-darwin-arm64"
      sha256 "20bd812c3b64cae72cef823184f161d766e717c6de73a0da58da5182f7cf4d45"
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
