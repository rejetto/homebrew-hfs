class Hfs < Formula
  desc "HTTP File Server"
  homepage "https://rejetto.com/hfs"
  version "3.3.4"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-mac-arm64-#{version}.zip"
      sha256 "928b4b6e346e3912af295ad09dd1218d1afedfef79a85f3267a60b38964c1312"
    else
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-mac-x64-#{version}.zip"
      sha256 "37081a3f667803908f8c3609edb9c96dc22666d9fe8ebb3b63a21ab6a05d3a6f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-linux-arm64-#{version}.zip"
      sha256 "fca618b4eb0a5928f6e4fc9e73040efe34e1be9ec7186dec2c2330cf4f770749"
    else
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-linux-x64-#{version}.zip"
      sha256 "1a78de57bf64055a95bc6617c8f70590124772741e6205161f7a800a55b74167"
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
