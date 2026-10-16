# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "2.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.5.0/wolt_v2.5.0_darwin_amd64.tar.gz"
      sha256 "0de38693d6398de9155d188a12e8516d86b55ed721be0abd872a173b960d44b3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.5.0/wolt_v2.5.0_darwin_arm64.tar.gz"
      sha256 "251a2b678fea33aa5be04adb04bae1dbde68b8b1860d1da0cfefeb4a2bc1a4e9"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.5.0/wolt_v2.5.0_linux_amd64.tar.gz"
      sha256 "8d4466e8e92f735b762f975d63b55626d066038000630129fb40123bd17ad70b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.5.0/wolt_v2.5.0_linux_arm64.tar.gz"
      sha256 "f1c2fb85a0895638c261a789160530bdab4407d7e436d57a3263007e2df64864"
    end
  end

  def install
    bin.install "wolt", "wolt-mcp"
  end

  test do
    output = shell_output("#{bin}/wolt --help")
    assert_match "wolt", output
    mcp_output = shell_output("#{bin}/wolt-mcp --version")
    assert_match version.to_s, mcp_output
  end
end
