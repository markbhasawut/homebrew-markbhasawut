class MacLinuxKdk < Formula
  desc "Linux Kernel Development Kit for macOS"
  homepage "https://github.com/markbhasawut/mac-linux-kdk"
  version "2024.03.04-a3297b5"

  url "https://github.com/markbhasawut/mac-linux-kdk/archive/a3297b521eb7cc642b80e1beea692afa71889bcd.zip"
  sha256 "eab92deb218006f0ae23a69b8c364a0d49d4381a4ff7a441d3b890d10865f139"
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