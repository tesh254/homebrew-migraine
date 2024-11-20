class Migraine < Formula
  desc "A CLI for managing migrations in backend projects with PostgreSQL"
  homepage "https://github.com/tesh254/migraine"
  version "${VERSION#v}"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/tesh254/migraine/releases/download/${VERSION}/migraine-darwin-amd64"
      sha256 "$SHA256_INTEL"
    else
      url "https://github.com/tesh254/migraine/releases/download/${VERSION}/migraine-darwin-arm64"
      sha256 "$SHA256_ARM"
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
EOL
