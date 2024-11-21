class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "0.0.10"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v0.0.10/migraine-darwin-amd64"
      sha256 "c1982fbd225093b2288ba384b6c2770b76cf9dcd9ab2dfb7435cf257df41bb01"
    else
      url "https://github.com/tesh254/migraine/releases/download/v0.0.10/migraine-darwin-arm64"
      sha256 "69952b85a60cc81f399768ac652892c33e80b5c685af17506ce902f4c431d70a"
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
