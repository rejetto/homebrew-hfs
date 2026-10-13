class Hfs < Formula
  desc "HTTP File Server"
  homepage "https://rejetto.com/hfs"
  version "3.4.0-rc4"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-mac-arm64-#{version}.zip"
      sha256 "5fb720b6f11e9a4f0edc6fde0b2d1198b1478126eafd3d9e7e9a2713e8e2e88f"
    else
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-mac-x64-#{version}.zip"
      sha256 "a7a9b23726fcd4d3d4f1e4a51ab5d2b2a21d1fde5b4d2d26d1f70ddff7d2039c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-linux-arm64-#{version}.zip"
      sha256 "d2946d555d7a5e32677a5c2d8c42d94d880ac9501edf16f5d9de4225a3743613"
    else
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-linux-x64-#{version}.zip"
      sha256 "fb39cf7491cdb226b7c0ed9a93cf990fdb12cda09ecdec4a7dcb69f37b9fdb74"
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
