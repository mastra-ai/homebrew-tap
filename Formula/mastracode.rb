class Mastracode < Formula
  desc "Terminal-based AI coding agent built with Mastra"
  homepage "https://code.mastra.ai/"
  url "https://registry.npmjs.org/mastracode/-/mastracode-0.21.2.tgz"
  sha256 "738c75f467014d0923af8c1dc8e4521b03780efddcc2178ad80b498316e514d8"
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
