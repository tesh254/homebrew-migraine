class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "0.0.12"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v0.0.12/migraine-darwin-amd64"
      sha256 "4c3082d7f6c0a1b05fb366cf925834a1051e785b4534b31b44a31fc1c66cc4cd"
    else
      url "https://github.com/tesh254/migraine/releases/download/v0.0.12/migraine-darwin-arm64"
      sha256 "6e008a4dccdd004d4ea25a76fc6db2a5896cccf3d84e38e1220f7ffe472e09bc"
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
