class MacLinuxKdk < Formula
  desc "Linux Kernel Development Kit for macOS"
  homepage "https://github.com/markbhasawut/mac-linux-kdk"
  version "2024.03.04-9662141"

  url "https://github.com/markbhasawut/mac-linux-kdk/archive/966214117fc7bc3c59ad4d3e61a980ac9faadafd.zip"
  sha256 "b2caf8fd1fc4ccfacdea5ee8952025bc412ca608597a4b988dfb5b6e866c3a58"
  license "LGPL-3.0-or-later" => { with: "LGPL-3.0-linking-exception" }

  depends_on "coreutils"
  depends_on "file-formula"
  depends_on "findutils"
  depends_on "gawk"
  depends_on "gnu-sed"
  depends_on "gnu-tar"
  depends_on "grep"
  depends_on "libtool"
  depends_on "llvm"
  depends_on "make"
  depends_on "ncurses"
  depends_on "openssl@3"

  def install
    bin.install Dir["bin/*"]
    libexec.install Dir["*"]
  end
end