class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "0.0.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v0.0.5/migraine-darwin-amd64"
      sha256 "51bca057ff06b74d7d43edc988ce4ddc48adc6bb37849b4c94b0601ca5b38879"
    else
      url "https://github.com/tesh254/migraine/releases/download/v0.0.5/migraine-darwin-arm64"
      sha256 "a8c8da0eea2b73c4133c8e91b13b522f890f7f19530d4c37f4cae1c90c6856f3"
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
