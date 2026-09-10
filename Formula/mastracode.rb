class Mastracode < Formula
  desc "Terminal-based AI coding agent built with Mastra"
  homepage "https://code.mastra.ai/"
  url "https://registry.npmjs.org/mastracode/-/mastracode-0.39.1.tgz"
  sha256 "d76a51be588d1f3c8d726dbd37b2ddf3d64f15522de97fe046a1bb6711b06fd3"
  license "BUSL-1.1"

  livecheck do
    url "https://registry.npmjs.org/mastracode"
    regex(/["']version["']:\s*["']([^"']+)["']/i)
  end

  depends_on "node@22"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    output = shell_output("#{bin}/mastracode --version 2>&1", 0)
    assert_match(/\d+\.\d+\.\d+/, output)
  end
end
