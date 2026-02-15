class Hfs < Formula
  desc "HTTP File Server"
  homepage "https://rejetto.com/hfs"
  version "3.0.3"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-mac-arm64-#{version}.zip"
      sha256 "8541b7a125e8174a63bbcb206ac2cf13b025f59ef46ca4cd756f26471e487a73"
    else
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-mac-x64-#{version}.zip"
      sha256 "8376e6d56c73f34a8183fd3160e274bd49bb3ba67bd44f96542435a3036318a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-linux-arm64-#{version}.zip"
      sha256 "ad25be53c57aff092065624bd8bf26b607b6a2d1f00c0c59a8a027f794d38b11"
    else
      url "https://github.com/rejetto/hfs/releases/download/v#{version}/hfs-linux-x64-#{version}.zip"
      sha256 "4f96d6abae85d59bb1a415439e981993c61939fb60ca3b4a722785566501f898"
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
