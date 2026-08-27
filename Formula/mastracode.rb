class Mastracode < Formula
  desc "Terminal-based AI coding agent built with Mastra"
  homepage "https://code.mastra.ai/"
  url "https://registry.npmjs.org/mastracode/-/mastracode-0.36.1.tgz"
  sha256 "f29d58e7393a4efbccce98e2b9c515ea1800e42704f2cec5a183b1f507134dfe"
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
