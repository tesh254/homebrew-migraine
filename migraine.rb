class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "1.0.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v1.0.4/migraine-darwin-amd64"
      sha256 "d2cb8b223801523402424b02768c315ec1c0c6a2fc0c4897988e92c1a470a73a"
    else
      url "https://github.com/tesh254/migraine/releases/download/v1.0.4/migraine-darwin-arm64"
      sha256 "133bce6dfc38a36f0a0829c294b27d2ca886b0aba2307d2f79b4f532503d2db2"
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
