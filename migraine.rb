class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "2.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v2.1.0/migraine-darwin-amd64"
      sha256 "caee1fb65bccda68ad0b25f02b0766001cd5b0f79074862d1bff5d9e148faa72"
    else
      url "https://github.com/tesh254/migraine/releases/download/v2.1.0/migraine-darwin-arm64"
      sha256 "25800b5dc012703d02d973507eac0ea0f431ad1da928adabb99b98ad25428cb4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v2.1.0/migraine-linux-amd64"
      sha256 "db06c98f73cde7b7e1aa707293d7543dab3dc56fdabd688ee7876154cda071cd"
    else
      url "https://github.com/tesh254/migraine/releases/download/v2.1.0/migraine-linux-arm64"
      sha256 "156b9dbfd691f88a604c3604fb75ed3fb668efd01a3a3b0deca3180370ae12b0"
    end
  end

  def install
    bin.install Dir["migraine-*"][0] => "migraine"
    bin.install_symlink "migraine" => "mgr"
  end

  test do
    system "#{bin}/migraine", "--version"
    system "#{bin}/mgr", "--version"
    assert_match version.to_s, shell_output("#{bin}/migraine version --short")
    assert_match "Platform:", shell_output("#{bin}/migraine version")
    json_output = shell_output("#{bin}/migraine version --json")
    assert_match "version", json_output
    assert_match "platform", json_output
  end
end