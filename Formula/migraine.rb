class Migraine < Formula
    desc "migraine is a command-line interface (CLI) tool designed to help you manage migrations in your backend project using a PostgreSQL database."
    homepage "https://github.com/tesh254/migraine"
    url "https://github.com/tesh254/migraine/releases/download/v0.0.2-alpha.2/migraine_0.0.2-alpha.2_darwin_amd64.tar.gz"
    sha256 "de2d39e4df63776f6cef98ec89ba3d375729217d94f001db244114ddde3414aa"
    version "v0.0.2-alpha.2"
    version_scheme 1
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/tesh254/migraine/releases/download/v0.0.2-alpha.2/migraine_0.0.2-alpha.2_darwin_arm64.tar.gz"
        sha256 "6b251e30925a8642251bded8daa992aa2752448f58a98cba3a9e21edbdc353f2"
      end
    end
  
    def install
        bin.install "migraine"
    end
  
    test do
      system bin/"migraine", "--version"
    end
end
  
