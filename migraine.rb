class Migraine < Formula
  desc "A robust CLI tool used to organize and automate complex workflows with templated commands"
  homepage "https://github.com/tesh254/migraine"
  version "1.0.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/v1.0.1/migraine-darwin-amd64"
      sha256 "6201ca55f91245d2bf9ad61205367ade45931f9628b6679b62dda31959827cb6"
    else
      url "https://github.com/tesh254/migraine/releases/download/v1.0.1/migraine-darwin-arm64"
      sha256 "be62a782113aefbcae7432ad17a92001be72cd4ec3b23821f2f5f1e19f5d8d9a"
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
