class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "0.0.7"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v0.0.7/migraine-darwin-amd64"
      sha256 "a0b0ced155ad436d8b87ab454d0b1e447bf08b52193952f094dccd457bf5a7b5"
    else
      url "https://github.com/tesh254/migraine/releases/download/v0.0.7/migraine-darwin-arm64"
      sha256 "490e3faad60130854559d4dbb7279f7c6fa7cd64ca6e6280887a23bf6d1c9069"
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
