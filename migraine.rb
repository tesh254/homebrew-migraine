class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "2.0.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v2.0.6/migraine-darwin-amd64"
      sha256 "fc586cf1d3228b71ddabcfe7834daee76189983489d9424ae4451d02da04f032"
    else
      url "https://github.com/tesh254/migraine/releases/download/v2.0.6/migraine-darwin-arm64"
      sha256 "941d28a9393f2f791baf3f0db87278075089226720bf9744eaca674d56ca94df"
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
