class Hfs < Formula
  desc "HTTP File Server"
  homepage "https://rejetto.com/hfs"
  version "3.0.7"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-mac-arm64-#{version}.zip"
      sha256 "6c91dfcac35fb4e74333a7a53226b5cf07d328774d3e899ce0ce483932f6b579"
    else
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-mac-x64-#{version}.zip"
      sha256 "42612b9e3a7c6d972332ea93d0b413a7a908aacc3eef8af1a10e2e1fd04a9123"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-linux-arm64-#{version}.zip"
      sha256 "8528983ff41b92d1ca3d8ca3d2efe085ec19cf8428d7e80b1c3f444ab87f50fd"
    else
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-linux-x64-#{version}.zip"
      sha256 "d09bcc6c86b9ac0607745faa223d9e7b11e131bc3decf85c53f892ee871a4d4c"
    end
  end

  def install
    libexec.install "hfs", "plugins"
    bin.write_exec_script(libexec/"hfs")
  end

  test do
    assert_match "HELP", shell_output("#{bin}/hfs --help")
  end
end
