class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "2.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v2.1.0/migraine-darwin-amd64"
      sha256 "d2878469eb0574e2343a2bb2d27a331081cdd914e68cb0c8ae54d4482e1571e6"
    else
      url "https://github.com/tesh254/migraine/releases/download/v2.1.0/migraine-darwin-arm64"
      sha256 "7edb7998df0ed73c95bdaedd7e25291f8af5e7766f4bd5ddb7856a07f96ede2c"
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
