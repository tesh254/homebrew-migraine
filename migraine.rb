class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "1.0.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v1.0.6/migraine-darwin-amd64"
      sha256 "b2a862e4d232bb48c68714aa40a39b50ab9e15fc53f6390b4c6b02f1159b8e72"
    else
      url "https://github.com/tesh254/migraine/releases/download/v1.0.6/migraine-darwin-arm64"
      sha256 "eeaf1f0911cef029ffdbac221e321f24fc48e66025ba747a4e541f9f1bf49129"
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
