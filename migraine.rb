class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "2.0.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v2.0.3/migraine-darwin-amd64"
      sha256 "e4b6731bb3cd29560981410f4811d016da071a1d607446efc77fd806f119b085"
    else
      url "https://github.com/tesh254/migraine/releases/download/v2.0.3/migraine-darwin-arm64"
      sha256 "dff775114a65c4229a4f1e477f1ab9cf91654992e10fa79deee9cc1400e84f7e"
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
