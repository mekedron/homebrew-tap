# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "2.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.5.3/wolt_v2.5.3_darwin_amd64.tar.gz"
      sha256 "4404dfcb0a1fbb5e0f64c38e653c1124aeff39f6bf3dba33987bad26d75b5fca"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.5.3/wolt_v2.5.3_darwin_arm64.tar.gz"
      sha256 "2a29b5ede4d968a4818b67415cac8f232f195c22e1219c325fbd1fcf452c522c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.5.3/wolt_v2.5.3_linux_amd64.tar.gz"
      sha256 "58ec8c6cbafefec918ce4d064487dd97b609515fdd9cf244bff78ce55ca1cfd5"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.5.3/wolt_v2.5.3_linux_arm64.tar.gz"
      sha256 "ebb64bfd5be3820929a0d51d48f5824bf7102b21ad529d458afc484a683e592b"
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
