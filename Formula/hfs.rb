class Hfs < Formula
  desc "HTTP File Server"
  homepage "https://rejetto.com/hfs"
  version "3.3.0-rc7"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-mac-arm64-#{version}.zip"
      sha256 "6eb1a8600edbf9bad47bc1dd89b45ebc2c584134f84fc907210ca5dec12ca20c"
    else
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-mac-x64-#{version}.zip"
      sha256 "c77cd620bb63ef8d361ae65beb1361e32b09a6c2c9af623863ba5eba1a5dd524"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-linux-arm64-#{version}.zip"
      sha256 "4a55094ad598fc6ed091b5500d6080df94bc1da37e603989a04b980724709a4c"
    else
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-linux-x64-#{version}.zip"
      sha256 "34a337bf10d92b5150fc1e52414df01f3660f795a22428ef056b8e3c66950710"
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
