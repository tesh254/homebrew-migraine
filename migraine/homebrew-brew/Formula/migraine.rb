class Migraine < Formula
    desc "migraine is a command-line interface (CLI) tool designed to help you manage migrations in your backend project using a PostgreSQL database."
    homepage "https://github.com/tesh254/migraine"
    url "https://github.com/tesh254/migraine/releases/download/v0.0.1-alpha.1/migraine_0.0.1-alpha.1_darwin_amd64.tar.gz"
    sha256 "df200bfc9afd63c5476d15cc396f9ac9f7b0234dda0bc3a7d648e804c9d1d794"
    version "v0.0.1-alpha.1"
    version_scheme 1
  
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/tesh254/migraine/releases/download/v0.0.1-alpha.1/migraine_0.0.1-alpha.1_darwin_arm64.tar.gz"
        sha256 "40195fe4878f6396d07f1651bd59c9655fab2b69050b1eaa2ad0f9d9cd8d5cc7"
      end
    end
  
    def install
        bin.install "migraine"
    end
  
    test do
      system bin/"migraine", "--version"
    end
end
  