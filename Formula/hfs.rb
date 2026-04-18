class Hfs < Formula
  desc "HTTP File Server"
  homepage "https://rejetto.com/hfs"
  version "3.1.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-mac-arm64-#{version}.zip"
      sha256 "dad6911ff6abe0a08ad78b327ed214389f72354c202da41259c0418dd40691d0"
    else
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-mac-x64-#{version}.zip"
      sha256 "b37a7d21f768e603dc5299e7d0df404e3e55ac5158bf742e8794b6d7cfe14dbd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-linux-arm64-#{version}.zip"
      sha256 "5f3674b57c16526f77b4d3cb034936818297f46ae20b3d70c4011445cf14a6a6"
    else
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-linux-x64-#{version}.zip"
      sha256 "acd257a77e66b952039b24a1637c7a4fa23e8dcab237f77b94b9f04bfd2df4fb"
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
