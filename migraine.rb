class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "0.0.8"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v0.0.8/migraine-darwin-amd64"
      sha256 "031853fe590668bb18a461b02f8c963d3d0d3cce3d6798ad8f5187434b62616f"
    else
      url "https://github.com/tesh254/migraine/releases/download/v0.0.8/migraine-darwin-arm64"
      sha256 "f8fc2b7fccca7ca930a4ead8be5879ff9f2b4affd687fc654642f4537c89f2d1"
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
