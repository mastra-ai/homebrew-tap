class Mastracode < Formula
  desc "Terminal-based AI coding agent built with Mastra"
  homepage "https://code.mastra.ai/"
  url "https://registry.npmjs.org/mastracode/-/mastracode-0.46.0.tgz"
  sha256 "510881e22bfe3a8d957cfa57336f542634069f75d18c0a5372ff8bf839104bbc"
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
