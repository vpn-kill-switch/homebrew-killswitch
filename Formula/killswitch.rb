class Killswitch < Formula
  desc "VPN kill switch for macOS"
  homepage "https://killswitch.network"
  url "https://github.com/vpn-kill-switch/killswitch.git", tag: "0.8.0", revision: "a04c0918fa40bf397b3a4658037a39bc24aef684"
  license "BSD-3-Clause"
  head "https://github.com/vpn-kill-switch/killswitch.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("#{bin}/killswitch 2>&1")
    assert_match "No VPN interface found", output
  end
end
