# typed: false
# frozen_string_literal: true

class WoltCli < Formula
  desc "Unofficial community CLI for interacting with Wolt APIs"
  homepage "https://github.com/mekedron/wolt-cli"
  version "2.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.5/wolt_v2.1.5_darwin_amd64.tar.gz"
      sha256 "4a42a55fc402bb5c5baa0488a775fbb29696cdfa6eb3399e574d1201f8ccab08"
    end
    if Hardware::CPU.arm?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.5/wolt_v2.1.5_darwin_arm64.tar.gz"
      sha256 "ba2324a1bd92eecbebded74aec24621d55e4a72180a2725262e86bd586e40e59"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.5/wolt_v2.1.5_linux_amd64.tar.gz"
      sha256 "0d6ff3f6fa3c5015e5d16cae35fa5bf1c1d0953254f1f92bd080889928d6a0e0"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mekedron/wolt-cli/releases/download/v2.1.5/wolt_v2.1.5_linux_arm64.tar.gz"
      sha256 "ef25a9232d2040f49fcc2a2d37ce7fe8be13111882ae6fbc48dab3b6032f175d"
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
